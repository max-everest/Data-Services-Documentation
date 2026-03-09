Write-Host ""
Write-Host "======================================="
Write-Host "Data Services Documentation - Local Preview"
Write-Host "======================================="
Write-Host ""

# ---------------------------------------------------------
# Activate Python environment
# ---------------------------------------------------------

if (Test-Path ".venv\Scripts\Activate.ps1") {
    Write-Host "Activating virtual environment..."
    .\.venv\Scripts\Activate.ps1
}
else {
    Write-Host "WARNING: No virtual environment found."
}

# ---------------------------------------------------------
# Sync content → docs (excluding drafts)
# ---------------------------------------------------------

Write-Host ""
Write-Host "Syncing content into docs..."

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

Write-Host "Content synced."

# ---------------------------------------------------------
# Build the MkDocs site
# ---------------------------------------------------------

Write-Host ""
Write-Host "Building MkDocs site..."

python -m mkdocs build

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "ERROR: MkDocs build failed."
    exit
}

Write-Host "Build successful."

# ---------------------------------------------------------
# Start local documentation server
# ---------------------------------------------------------

Write-Host ""
Write-Host "Starting local documentation server..."
Write-Host ""
Write-Host "Open the following URL in your browser:"
Write-Host ""
Write-Host "http://127.0.0.1:8000"
Write-Host ""

python -m mkdocs serve