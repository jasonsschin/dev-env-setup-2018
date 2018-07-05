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

Copy-Item "\\MAC\downloads\Core-20180108-104709.bak" -Destination "c:\tmp\Core-20180108-104709.bak"
Restore-SqlDatabase -ServerInstance "." -Database "Core" -BackupFile "c:\tmp\Core-20180108-104709.bak" -ReplaceDatabase -RelocateFile @($RelocateData,$RelocateLog)
Remove-Item "c:\tmp\Core-20180108-104709.bak"


# Restore Fileactive Database
$RelocateData = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("Fileactive", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\fileactive.mdf")
$RelocateLog = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("Fileactive_Log", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\fileactve.ldf")

Copy-Item "\\MAC\downloads\Fileactive-20180627.bak" -Destination "c:\tmp\Fileactive-20180627.bak"
Restore-SqlDatabase -ServerInstance "." -Database "Fileactive" -BackupFile "c:\tmp\Fileactive-20180627.bak" -ReplaceDatabase -RelocateFile @($RelocateData,$RelocateLog )
Remove-Item "c:\tmp\Fileactive-20180627.bak"

# Restore PSI Database
$RelocateData = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("Fileactive", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\psi.mdf")
$RelocateLog = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile("Fileactive_Log", "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\psi.ldf")

Copy-Item "\\MAC\downloads\20180516-psi.bak" -Destination "c:\tmp\20180516-psi.bak"
Restore-SqlDatabase -ServerInstance "." -Database "PSI" -BackupFile "c:\tmp\20180516-psi.bak" -ReplaceDatabase -RelocateFile @($RelocateData,$RelocateLog )
Remove-Item "c:\tmp\20180516-psi.bak"
