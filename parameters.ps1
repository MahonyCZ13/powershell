#Author: Petr Maronek
#Sandbox: Launching scripts with parameters

param([Int32]$userParam)

Clear-Host

Write-Host "Parameter of the script is:" $userParam

$userInput = Read-Host -Prompt "Input Today's Batch number"

if([string]::IsNullOrEmpty($userInput)) {
    Write-Host "You didn't supplied any Batch number!" -ForegroundColor Red
}
else{
    [int]$BatchNum = [convert]::ToInt32($userInput,10)
    Write-Host "Batch number is:" $userInput
}
