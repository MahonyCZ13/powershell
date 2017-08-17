#Author: PM
#Basics

Clear-Host

try {
    $items = Import-Csv .\SourceFiles\data.csv
    Write-Host "Success" -ForegroundColor Green

    foreach ($item in $items) {
        Write-Host $item.title
    }
}
catch {
    Write-Host "Error" -ForegroundColor Red
}

Write-Host "End of file" -ForegroundColor Yellow