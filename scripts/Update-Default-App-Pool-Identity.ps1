Import-Module WebAdministration

$ap = Get-Item IIS:\AppPools\DefaultAppPool

$ap.processModel.userName = "vagrant"
$ap.processModel.password = "vagrant"
$ap.processModel.identityType = 2 # NetworkService https://docs.microsoft.com/en-us/iis/configuration/system.applicationhost/applicationpools/add/processmodel
$ap | Set-Item