# PowerShell Deployment Script for MkDocs

# --- Configuration ---
$SiteUrl = "https://max-everest.github.io/Data-Services-Documentation/"
$VenvPath = ".\.venv"
$PythonExecutable = Join-Path -Path $VenvPath -ChildPath "Scripts\python.exe"

# --- Script ---

# 1. Check for Virtual Environment
if (-not (Test-Path $PythonExecutable)) {
    Write-Host "ERROR: Python virtual environment not found at '$PythonExecutable'."
    Write-Host "Please run 'python -m venv .venv' to create it."
    exit 1
}

Write-Host "Virtual environment found."

# 2. Sync content → docs
Write-Host "Syncing content folder into docs..."

# Remove only documentation markdown files but keep assets
Get-ChildItem docs -Recurse -File -Include *.md | Remove-Item -Force

# Copy content excluding drafts
Get-ChildItem content -Recurse -File |
Where-Object { $_.FullName -notmatch "\\drafts\\" } |
ForEach-Object {

    $relative = $_.FullName.Substring((Resolve-Path content).Path.Length + 1)
    $target = Join-Path docs $relative

    $targetDir = Split-Path $target
    if (!(Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
    }

    Copy-Item $_.FullName $target -Force
}

Write-Host "Content successfully synced to docs."

# 3. Build the site
Write-Host "Building MkDocs site..."

$buildCmd = "& `"$PythonExecutable`" -m mkdocs build --clean"
Invoke-Expression -Command $buildCmd

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: MkDocs build failed."
    exit 1
}

Write-Host "MkDocs build completed."

# 4. Deploy to GitHub Pages
Write-Host "Deploying to GitHub Pages..."

$deployCmd = "& `"$PythonExecutable`" -m mkdocs gh-deploy --clean --message 'Automated deployment via deploy.ps1'"
Invoke-Expression -Command $deployCmd

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: MkDocs deployment failed."
    exit 1
}

Write-Host "Deployment successful."

# 5. Wait for GitHub Pages
Start-Sleep -Seconds 30

Write-Host "Validating live site..."

try {
    $response = Invoke-WebRequest -Uri $SiteUrl -UseBasicParsing -ErrorAction Stop
    if ($response.StatusCode -eq 200) {
        Write-Host "SUCCESS: Site is live."
    } else {
        Write-Host "ERROR: Site returned status $($response.StatusCode)."
    }
} catch {
    Write-Host "ERROR: Unable to reach site."
}

Write-Host "Deployment process complete."