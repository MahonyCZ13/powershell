# Script setTSProject
<#
.SYNOPSIS
    Set Typescript Development Environment
.NAME
    TypeScript Project Creator
.DESCRIPTION
    Creates folder structure, example files and install all the necessary dependencies.
.NOTES
    Author: Petr Maronek
.LINK
    https://insidecurlybrackets.azurewebsites.net/
#>

Clear-Host

Write-Host @"

 #######################
 #######################
 #######################
 ###        ####/     )#
 ######  #######   #####
 ######  #######/    /##
 ######  ###########  ##
 ######  ######(     /##
 #######################
"@ -ForegroundColor Blue

Write-Host "`n Welcome to Typescript project creation script!" -ForegroundColor Yellow
Write-Host " Let us get started`n" -ForegroundColor Yellow

[string]$nodeInstallation = Read-Host -Prompt "First thigs first. Do you have NodeJS with NPM installed? (Y/n)"

if($nodeInstallation -Match "y" -or $nodeInstallation -Match $null) {
    Write-Host "`nGreat!" -ForegroundColor Yellow
}
elseif($nodeInstallation -Match "n") {
    Write-Host "`nSorry, you need to install NodeJS. You can get from here: https://nodejs.org/en/`n"
    Break
}
else {
    Write-Host "`nYour Answer was not recognized. Please launch the script again..." -ForegroundColor Red
    Break
}

######## Project name default value handler ########
$projectDefaultValue = "hello-world"
$projectName = Read-Host -Prompt "`nWhat is the name of the project? ($projectDefaultValue)"
$projectName = ($projectDefaultValue, $projectName)[[bool]$projectName]
Write-Host "`nGot it! Give me a sec to do some basic stuff for you..." -ForegroundColor Yellow

######## Set Variables ########
Write-Host "`nSetting variables..."
$configFolder = 'config'
$stepBack = '../'
$tsContent = @"
export {};

class Program {
    public greeting: string;

    constructor(text: string) {
        this.greeting = text;
    }
    public greet() {
        console.log(``Hello, $`{this.greeting}``);
    }
}
let ge = new Program("User!");
ge.greet();

"@
$tsConfigContents = @"
{
    "compilerOptions": {
        "rootDir": "../src/ts",
        "outDir": "../src/js",
        "target": "es5",
        "typeRoots": [
            "./typings"
        ],
        "sourceMap": true
    },
    "include": [
        "../src/ts/*",
        "./typings/*"
    ],
    "exclude": [
        "node_modules"
    ],
    "files": [
        "../src/ts/first.ts",
        "../src/ts/second.ts",
        "../src/ts/third.ts"
    ]
}
"@
Write-Host "`nDone!" -ForegroundColor Green

Write-Host "`n----------------------------" -ForegroundColor Blue
Write-Host " Creating structure..."
Write-Host "----------------------------" -ForegroundColor Blue

######## Check, if project already exists ########
Try 
{
    New-Item -ItemType Directory $projectName -ErrorAction Stop | Out-Null
}
Catch
{
    $errorMessage = $_
    Write-host "Error Occured!!" -ForegroundColor Red
    Write-Host $errorMessage`n -ForegroundColor Red
    Write-Host "Exiting...`n" -ForegroundColor Yellow
    Break
}

Set-Location -Path $projectName
New-Item -ItemType Directory 'src' | Out-Null
Set-Location -Path 'src' | Out-Null
New-Item -ItemType Directory 'js' | Out-Null
New-Item -ItemType Directory 'ts' | Out-Null
New-Item -ItemType File 'index.html' | Out-Null

######## Create example TS file ########
Set-Location -Path 'ts' | Out-Null
New-Item -ItemType File 'hello.ts' | Out-Null
Try {
    $tsContent | Set-Content 'hello.ts' -ErrorAction Stop
}
Catch {
    $errorMessage = $_
    Write-host "Error Occured!!" -ForegroundColor Red
    Write-Host $errorMessage`n -ForegroundColor Red
    Write-Host "Exiting...`n" -ForegroundColor Yellow
    Break
}
1..2 | ForEach-Object {Set-Location $stepBack}

######## Configure 'config' directory ########
New-Item -ItemType Directory $configFolder | Out-Null
Set-Location -Path $configFolder | Out-Null
New-Item -ItemType Directory 'typings' | Out-Null
New-Item -ItemType File 'tsconfig.json' | Out-Null
Try {
    $tsConfigContents | Set-Content 'tsconfig.json' -ErrorAction Stop
}
Catch {
    $errorMessage = $_
    Write-host "Error Occured!!" -ForegroundColor Red
    Write-Host $errorMessage`n -ForegroundColor Red
    Write-Host "Exiting...`n" -ForegroundColor Yellow
    Break
}
Set-Location -Path $stepBack
Write-Host "`nDone!" -ForegroundColor Green
Break
######## Confiure NPM Environment ########
Write-Host "`nNow we will setup our NPM envirnment" -ForegroundColor Yellow

Write-Host "`n----------------------------" -ForegroundColor Blue
Write-Host " NPM initialization "
Write-Host "----------------------------`n" -ForegroundColor Blue

npm init

Write-Host "`nDone!" -ForegroundColor Green

######## Install TypeScript ########
Write-Host "`nLet me install latest Typescript and all its dependencies for you..." -ForegroundColor Yellow

Write-Host "`n----------------------------" -ForegroundColor Blue
Write-Host " Typescript setup "
Write-Host "----------------------------`n" -ForegroundColor Blue

npm install typescript@latest --save-dev

Write-Host "`nDone!" -ForegroundColor Green

######## Install ESLint ########
Write-Host "`nIt is time for us set up ESLint for some linting magic!" -ForegroundColor Yellow

Write-Host "`n----------------------------" -ForegroundColor Blue
Write-Host " ESLint setup "
Write-Host "----------------------------`n" -ForegroundColor Blue
Write-Host "Installing ESLint..." -ForegroundColor Yellow

npm install eslint --save-dev

Write-Host "`nDone!" -ForegroundColor Green

######## Install TypeScript for ESLint ########
Write-Host "`nInstalling ESLint for Typescript..." -ForegroundColor Yellow

npm install typescript-eslint-parser --save-dev

Write-Host "`nDone!" -ForegroundColor Green

######## Initialize ESLint for current project ########
Write-Host "`nConfiguring ESLint...`n" -ForegroundColor Yellow

eslint --init

Write-Host "`nDone!" -ForegroundColor Green
Write-Host @"

Installation finished. You can now develop the next big thing!
Happy coding!

"@ -ForegroundColor Yellow
