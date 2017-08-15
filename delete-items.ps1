$path = Get-Location
$string = "(1)"

Get-ChildItem -Path $path | Where-Object {$_.Name -match $string} | ForEach-Object {Remove-Item $_.FullName}