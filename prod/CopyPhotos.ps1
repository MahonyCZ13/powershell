# CopyPhotos.ps1
<#
.SYNOPSIS
    Copy photos from folder structure
.NAME
    Photo Copy
.DESCRIPTION
    Copy photos from Google to OneDrive or from/to any other location
.NOTES
    Author: Petr Maronek
.LINK
    https://insidecurlybrackets.azurewebsites.net/
#>

Write-Host "Copying pictures to OneDrive..." -ForegroundColor Yellow
Get-ChildItem "C:\Users\profile\Documents\Google Photos" -filter *.jpg -Recurse| ForEach-Object {Copy-Item -Path $_.FullName -Destination "C:\Users\profile\OneDrive\Pictures\Camera Roll" }
Write-Host "Pictures successfully copied to OneDrive!" - -ForegroundColor Green
