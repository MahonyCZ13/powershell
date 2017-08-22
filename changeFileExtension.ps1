# Author: Petr Maronek
# A script for changing the file extensions

Clear-Host

Write-Host "This script will change extensions of all files in current directory."

$userInput1 = Read-Host -Prompt "From"
$userInput2 = Read-Host -Prompt "To"

$StartTime = Get-Date -Format "d-MM-yyyy HH:mm:ss"

Write-Host "Starting conversion on" $StartTime -ForegroundColor Yellow

$source = '*.' + $userInput1
$target = $userInput2
$location = 'C:\Users\Profile\Downloads\NewFolder\'
$path = $location + $source

Get-ChildItem $path | rename-item -newname {
    [io.path]::ChangeExtension($_.name, $target)
}

$EndTime = Get-Date -Format "d-MM-yyyy HH:mm:ss"
Write-Host "Conversion completed on" $EndTime  -ForegroundColor Green