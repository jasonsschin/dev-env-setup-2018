<#
if ((Get-Module "WebAdministration" -ErrorAction SilentlyContinue) -eq $null){
	Import-Module WebAdministration
}
#>

if (Get-Module -ListAvailable -Name WebAdministration){
    #Write-Host "Module exists"
} else {
    Write-Host "Module does not exist"
    Write-Host "Import WebAdministration"
    Import-Module WebAdministration
}

$Websites = Get-ChildItem IIS:\Sites 


$apps = Get-WebApplication -Site $Websites.name
$website = $Websites.name

 foreach($app in $apps){
    #Write-Host $webvdirectory.path
    if ($app.PhysicalPath.StartsWith("D:\anz")){
    $appname = $app.path.Trim('/')
    $appPath = $app.path

    Write-Host "Application name: $appname"
    Write-Host "Physical path: " $app.PhysicalPath

    #$test ="IIS:\Sites\$website\$appName"
    $path = "/system.applicationHost/sites/site[@name='$website' and @id='1']/application[@path='$appPath']/VirtualDirectory[@path='/']"

    Write-Host "App path: $path"

    $updatedPhysicalPath = $app.PhysicalPath
    $updatedPhysicalPath = $updatedPhysicalPath.Replace("D:\anz", "\\MAC\Projects\anz")

    Write-Host "Updated physical path: $updatedPhysicalPath"

    Write-Host ""
    Set-WebConfiguration  $path  -Value  @{PhysicalPath=$updatedPhysicalPath}

    }

 }                                    
