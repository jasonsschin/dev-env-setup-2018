if (Get-Module -ListAvailable -Name SqlServer) {
    Write-Host "Module exists"
} else {
    Write-Host "Module does not exist"
    Install-Module -Name SqlServer -AllowClobber
}


function generate-db-file-backup-path {
param([string]$backupFolder,
[string]$datePrefix,
[string]$db,
[string]$branch
)
    $fileNameFormat = "{0}-{1}-{2}.bak"
    $filename = [string]::Format($fileNameFormat,$datePrefix, $db, $branch)
    $filePath = Join-Path -Path $backupFolder -ChildPath $filename
    $filePath

    return $filePath
}

Import-Module SqlServer

$serverInstance = "."
$localTemp = "c:\tmp\"
$networkFileShare = "\\MAC\downloads\" 
$formattedDate = $(Get-Date).ToString("yyyyMMdd")
$branch = "Master"

$databases =  @("Core")


foreach ($d in $databases) {
    Write-Host "Backing up $d..."
    $backupFile = generate-db-file-backup-path -backupFolder $localTemp -datePrefix $formattedDate -db $d -branch $branch
    Backup-SqlDatabase -ServerInstance $serverInstance -Database $d -BackupFile $backupFile
    Write-Host "Backup to $backupFile complete!"
    Write-Host "" 
}

