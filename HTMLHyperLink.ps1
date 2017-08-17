# Author Petr MAronek
# Parse HTML formatted hyperlinks

Clear-Host

$CurrentDT = Get-Date -Format "d-MM-yyyy HH:mm:ss"

Write-Host "Script started" $CurrentDT

Try {

    $urls = Get-Content .\SourceFiles\rawData.txt
    Write-Host "File loaded successfuly. Parsing links..." -ForegroundColor Yellow

    Try {

        $result = @()

        foreach($url in $urls) {
            $array = $url.Split(">").Split("<")
            $result += $array[2]
        }

        $result | Out-File -FilePath .\OutputFiles\parsedUrls.txt -Encoding ascii

        Write-Host "Urls parsed successfuly. Opening file..." -ForegroundColor Green

        Invoke-Item .\OutputFiles\parsedUrls.txt

    }
    Catch {

        Write-Host "Error in parsing URLs" -ForegroundColor Red

    }
}
Catch {

    Write-Host "Error loading file." -ForegroundColor Red
    
}

Write-Host "Script ended" $CurrentDT