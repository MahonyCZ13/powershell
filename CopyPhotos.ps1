Write-Host "Copying pictures to OneDrive..." -ForegroundColor Yellow
Get-ChildItem "C:\Users\profile\Documents\Google Photos" -filter *.jpg -Recurse| ForEach-Object {Copy-Item -Path $_.FullName -Destination "C:\Users\profile\OneDrive\Pictures\Camera Roll" }
Write-Host "Pictures successfully copied to OneDrive!" - -ForegroundColor Green
