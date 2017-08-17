# Author: Petr Maronek
# Generate CSV for migration script

Clear-Host

$curentPath = Get-Location
$sourceLocation = "\SourceFiles\"
$sourceFileName = "urlsRaw.txt"

Try {
    
    $urls = Get-Content $curentPath$sourceLocation$sourceFileName
    Write-Host "File loaded" -ForegroundColor Yellow

    "SourceUrl,TargetUrl,owner,batch" | Out-File -FilePath ".\OutputFiles\exported_URLs.csv" -Encoding ascii

    foreach($url in $urls){
        $array = $url.Split(">").Split("<").Split("#").Split(";").Split("")
        $resultString = $array[3] + "," + $array[9] + "," + $array[14] + "," + $array[-1]
        $resultString | Out-File -FilePath ".\OutputFiles\exported_URLs.csv" -Append -Encoding ascii
    }

    Write-Host "CSV generated successfuly. Opening file..."  -ForegroundColor Green

    Invoke-Item ".\OutputFiles\exported_URLs.csv"

}

Catch {

    Write-Host "Error loading file" -ForegroundColor Red

}