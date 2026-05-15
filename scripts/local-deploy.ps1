Write-Host ""
Write-Host "======================================="
Write-Host "Data Services Documentation - Local Preview"
Write-Host "======================================="
Write-Host ""

$VenvPath = ".\.venv"
$PythonExecutable = Join-Path -Path $VenvPath -ChildPath "Scripts\python.exe"

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

if (-not (Test-Path $PythonExecutable)) {
    Write-Host "ERROR: Python virtual environment not found at '$PythonExecutable'."
    exit 1
}

# ---------------------------------------------------------
# Build the MkDocs site from content/
# ---------------------------------------------------------

Write-Host ""
Write-Host "Building MkDocs site..."

& $PythonExecutable -m mkdocs build

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

& $PythonExecutable -m mkdocs serve