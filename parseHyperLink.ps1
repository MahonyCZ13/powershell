#Author: Petr Maronek
#Extract link from 'a href' HTML tag

Clear-Host

Try {
    $urls = Get-Content C:\Users\PROFILE\Documents\projects_Local\repos\powershell\SourceFiles\urlsRaw.txt
    Write-Host "File loaded" -ForegroundColor Yellow

    $result = @()

    foreach($url in $urls){
        $array = $url.Split(">").Split("<")
        $result += $array[2]
    }

    Write-Output $result | Out-File -FilePath ".\OutputFiles\exported_URLs.csv" -Encoding ascii

    Write-Host "URLs extracted successfully"  -ForegroundColor Green
}
Catch {
    Write-Host "Error loading file" -ForegroundColor Red
}