# Define the project folder as the same directory where this script is located
$projectPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$venvPath = "$projectPath\venv"

# Create the project folder if it does not exist
if (-not (Test-Path $projectPath)) {
    New-Item -ItemType Directory -Path $projectPath
    Write-Host "Project folder created at $projectPath"
} 
else {
    Write-Host "Project folder already exists at $projectPath"
}

# Navigate to the project folder
Set-Location $projectPath

# Create the virtual environment
python -m venv $venvPath
Write-Host "Virtual environment created at $venvPath"

# Activate the virtual environment
& "$venvPath\Scripts\Activate.ps1"
Write-Host "Virtual environment activated"

# Install dependencies from requirements.txt
if (Test-Path "$projectPath\requirements.txt") {
    pip install -r "$projectPath\requirements.txt"
    Write-Host "Dependencies installed"
}
else {
    Write-Host "requirements.txt not found in $projectPath"
}

Write-Host "Setup completed! To exit the virtual environment, type: deactivate"

Write-Host "Press any key to close this window" -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")