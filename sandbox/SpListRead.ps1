# Author Petr Maronek
# Read data from SP List

Clear-Host

if((Get-PSSnapin | Where-Object {$_.Name -eq "Microsoft.SharePoint.PowerShell"}) -eq $null) {
    Add-PSSnapin Microsoft.SharePoint.PowerShell
}

$SPUrl = "https://contoso.sharepoint.com/sites/development/"
$SPList = "Sandbox"

$spGetWeb = Get-SPWeb $SPUrl
$spGetList = $spGetWeb.Lists[$SPList]

$spItems = $spGetList.Items | Where-Object {$_['ID'] -eq 1}

$spItems | ForEach-Object {
    Write-Host $_['ID']
    Write-Host $_['Title']
}