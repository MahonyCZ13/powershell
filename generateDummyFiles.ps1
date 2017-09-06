# Author: Petr Maronek
# A script for generating lots of dummy files

Clear-Host

$input = Read-Host -Prompt "How many files you want to generate?"

$i = 0

Write-Host "OK. Generating files..." -ForegroundColor Yellow

$StartTime = Get-Date -Format "d-MM-yyyy HH:mm:ss"

while ($i -ne $input) {
    $location = 'C:\Users\Profile\Downloads\NewFolder\dummy_file' + $i + '.txt'
    New-Item $location -ItemType file | Out-Null
    $i++
}

$EndTime = Get-Date -Format "d-MM-yyyy HH:mm:ss"
Write-Host "Files Generated:" $i
Write-Host "Generation started on" $StartTime
Write-Host "Files generated" -ForegroundColor Green 
Write-Host "Generation ended" $EndTime
