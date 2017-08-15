#Author: Petr Maronek
#Extract link from 'a href' HTML tag

Clear-Host

$curentPath = Get-Location
$sourceLocation = "\SourceFiles\"
$sourceFileName = "urlsRaw.txt"

Try {
    
    $urls = Get-Content $curentPath$sourceLocation$sourceFileName
    Write-Host "File loaded" -ForegroundColor Yellow

    $result = @()

    foreach($url in $urls){
        $array = $url.Split(">").Split("<")
        $result += $array[2]
    }

    Write-Output $result | Out-File -FilePath ".\OutputFiles\exported_URLs.csv" -Encoding ascii

    Write-Host "URLs extracted successfully. Opening file..."  -ForegroundColor Green

    Invoke-Item ".\OutputFiles\exported_URLs.csv"

}

Catch {

    Write-Host "Error loading file" -ForegroundColor Red

}