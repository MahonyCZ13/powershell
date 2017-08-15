#Author: Petr Maronek
#Extract link from 'a href' HTML tag

Clear-Host

Try {
    $urls = Get-Content C:\Users\pmaronek\Documents\projects_Local\repos\powershell\urlsRaw.txt
    Write-Host "File loaded" -ForegroundColor Yellow

    $result = @()

    foreach($url in $urls){
        $array = $url.Split(">").Split("<")
        $result += $array[2]
    }

    Write-Host $result 

    Write-Host "URLs extracted successfully"  -ForegroundColor Green
}
Catch {
    Write-Host "Error loading file" -ForegroundColor Red
}