
# Install SQL Server Management Studio
choco install -yes 'sql-server-management-studio'

# Install SQL Server Studio (from online)
choco install -yes 'sql-server-2017' --params="'/ConfigurationFile:\\MAC\vagrant\config\ConfigurationFile.ini'"

# Install Visual Studio 2017 from online
choco install -yes visualstudio2017professional --package-parameters "--includeRecommended --includeOptional --passive --locale en-US --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.WebCrossPlat --add Microsoft.VisualStudio.Component.TypeScript.2.0"

# Copy nuget sources file
Copy-Item \\mac\vagrant\config\nuget.config C:\Users\vagrant\AppData\Roaming\NuGet
