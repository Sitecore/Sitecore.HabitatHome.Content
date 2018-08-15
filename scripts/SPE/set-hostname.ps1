param(
    [string]$instanceUrl,
    [string]$username,
    [string]$password)
$ErrorActionPreference = 'Stop'

Import-Module SPE
Write-Host ("Connecting to {0}" -f $instanceUrl)

$session = New-ScriptSession -Username $username -Password $password -ConnectionUri $("https://" + $instanceUrl)

Invoke-RemoteScript -Session $session -ScriptBlock { 
    Get-Item -Path "master:/content/Habitat Sites/Habitat Home/Settings/Site Grouping/Habitat Home" | ForEach-Object {$_.HostName = "$instanceUrl"}
}