# Install SQL Server Management Studio (from local cache)
\\MAC\downloads\SSMS-Setup-ENU.exe /quiet /install /norestart /log \\MAC\vagrant\SSMS-install-log.txt

# Install SQL Server Studio (from local cache iso)
Copy-Item "\\MAC\downloads\SQLServer2017-x64-ENU-Dev.iso" -Destination "c:\windows\temp"
choco install -yes 'sql-server-2017' --params="'/IsoPath:c:\windows\temp\SQLServer2017-x64-ENU-Dev.iso /ConfigurationFile:\\MAC\vagrant\config\ConfigurationFile.ini'"
Remove-Item c:\windows\temp\SQLServer2017-x64-ENU-Dev.iso

# Install Visual Studio 2017 from the local cache
\\MAC\downloads\vs2017-professional-offline\vs_professional__2131433003.1473374862.exe --includeRecommended --includeOptional --passive --locale en-US --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.WebCrossPlat --add Microsoft.VisualStudio.Component.TypeScript.2.0

# Copy nuget sources file
Copy-Item \\mac\vagrant\config\nuget.config C:\Users\vagrant\AppData\Roaming\NuGet