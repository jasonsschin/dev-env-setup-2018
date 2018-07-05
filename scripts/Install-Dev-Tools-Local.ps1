function Show-Menu
{
    param (
        [string]$Title = 'Install Dev Tools Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Press '1' to install SQL Server 2017  (from the local cache)."
    Write-Host "2: Press '2' to install SQL Server 2017 Management Studio  (from the local cache)."
    Write-Host "3: Press '3' to install Visual Studio 2017 Professional (from the local cache)."
    Write-Host "4: Press '4' to update nuget sources file."
    Write-Host "5: Press '5' to clean up SQL Server 2017 iso file."
    Write-Host "Q: Press 'Q' to quit."
}


do
{
    Show-Menu  –Title 'Install Dev Tools Menu'
    $selection = Read-Host "Please make a selection?"

    switch ($selection)
     {
         '1' {
            # 1. Install SQL Server Studio (iso from local cache) -
            # Note: Restart Win 10 before install (most common cause for installation error)
            Write-Host "Install SQL Server 2017 (from local cache)"
            Copy-Item "\\MAC\downloads\SQLServer2017-x64-ENU-Dev.iso" -Destination "c:\windows\temp"
            choco install -yes 'sql-server-2017' --params="'/IsoPath:c:\windows\temp\SQLServer2017-x64-ENU-Dev.iso /ConfigurationFile:\\MAC\vagrant\config\ConfigurationFile.ini'" -v
         } '2' {
            # 2. Install SQL Server Management Studio (from local cache) - this runs in the background and immediately returns
            Write-Host "Install SQL Server 2017 Management Studio (from local cache)"

            $ssmsInstall = "\\MAC\downloads\SSMS-Setup-ENU.exe"
            $argumentList = "/quiet /install /norestart /log \\MAC\vagrant\logs\SSMS-install-log.txt"

            start-Process -FilePath $ssmsInstall -ArgumentList $argumentList -Wait
         } '3' {
             # 3. Install Visual Studio 2017 Professional from the local cache
            Write-Host "Install Visual Studio 2017 Professional (from local cache)"
            $vsInstall = "\\MAC\downloads\vs2017-professional-offline\vs_professional__2131433003.1473374862.exe"
            $argumentList =  "--includeRecommended --includeOptional --passive --locale en-US --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.WebCrossPlat --add Microsoft.VisualStudio.Component.TypeScript.2.0"

            start-Process -FilePath $vsInstall -ArgumentList $argumentList -Wait
        
         } '4' {
            # 4. Copy nuget sources file
            Write-Host "Copy nuget sources file"
            Copy-Item \\mac\vagrant\config\nuget.config C:\Users\vagrant\AppData\Roaming\NuGet
         } '5' {
            # clean up SQL Server 2017 file
            Write-Host "Clean up SQL Server 2017 file"
            Remove-Item c:\windows\temp\SQLServer2017-x64-ENU-Dev.iso
         } '6' {

         } 'q' {
             return
         }
     }
}
until ($selection -eq 'q')
