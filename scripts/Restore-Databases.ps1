## https://docs.microsoft.com/en-us/powershell/module/sqlserver/Restore-SqlDatabase?view=sqlserver-ps

if (Get-Module -ListAvailable -Name SqlServer) {
    Write-Host "Module exists"
} else {
    Write-Host "Module does not exist"
    Install-Module -Name SqlServer -AllowClobber
}

Import-Module SqlServer

# Note runs under NT SERVICE\MSSQLSERVER user context!

# Restore Core Database
$RelocateData = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("Core", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\core.mdf")
$RelocateLog = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("Core_Log", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\core.ldf")

Copy-Item "\\MAC\downloads\20180710-Core-Master.bak" -Destination "c:\tmp\20180710-Core-Master.bak"
Restore-SqlDatabase -ServerInstance "." -Database "Core" -BackupFile "c:\tmp\20180710-Core-Master.bak" -ReplaceDatabase -RelocateFile @($RelocateData,$RelocateLog)
Remove-Item "c:\tmp\20180710-Core-Master.bak"


# Restore Fileactive Database
$RelocateData = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("Fileactive", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\fileactive.mdf")
$RelocateLog = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("Fileactive_Log", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\fileactve.ldf")

Copy-Item "\\MAC\downloads\20180710-Fileactive-Rel32.bak" -Destination "c:\tmp\20180710-Fileactive-Rel32.bak"
Restore-SqlDatabase -ServerInstance "." -Database "Fileactive" -BackupFile "c:\tmp\20180710-Fileactive-Rel32.bak" -ReplaceDatabase -RelocateFile @($RelocateData,$RelocateLog )
Remove-Item "c:\tmp\20180710-Fileactive-Rel32.bak"

# Restore PSI Database
$RelocateData = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("PSI", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\psi.mdf")
$RelocateLog = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("PSI_Log", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\psi.ldf")

Copy-Item "\\MAC\downloads\20180710-PSI-Master.bak" -Destination "c:\tmp\20180710-PSI-Master.bak"
Restore-SqlDatabase -ServerInstance "." -Database "PSI" -BackupFile "c:\tmp\20180710-PSI-Master.bak" -ReplaceDatabase -RelocateFile @($RelocateData,$RelocateLog )
Remove-Item "c:\tmp\20180710-PSI-Master.bak"
