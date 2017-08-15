$commandName = $MyInvocation.MyCommand
$currentDate = Get-Date -UFormat "%Y%M%D"


$lines = Import-Csv 'C:\Users\PROFILE\Documents\projects_Local\powershell\list.csv'

Write-Host "Import succeded" -ForegroundColor Green

foreach ($line in $lines) {
    Write-Host "Processing line: " $line.id
    
    $site = ([System.Uri]$line.url).Segments[2]

    $result = ".\OutputFiles\" + $commandName + "_" + $currentDate + "_" + $site + ".txt"
    
    Start-Transcript -Path $result

}

Write-Host "Action completed" -ForegroundColor Yellow