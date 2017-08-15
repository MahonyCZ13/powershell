# A script for changing the file extensions

$source = '*.jfif'
$target = 'jpeg'
$location = 'C:\Users\PROFILE\Downloads\contacts\'
$path = $location + $source

Get-ChildItem $path | rename-item -newname {
    [io.path]::ChangeExtension($_.name, $target)
}