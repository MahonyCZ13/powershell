# Author: Petr Maronek
# Shuts down the pc, safely ends all processes, checks for updates

Clear-Host

<# $endProcess = (New-Object -ComObject Shell.Application).Windows() | 
    Where-Object {$_.FullName -ne $null} |
    Where-Object {$_.FullName.toLower().Endswith('\explorer.exe')}

$endProcess | ForEach-Object {$_.Quit()} #>


