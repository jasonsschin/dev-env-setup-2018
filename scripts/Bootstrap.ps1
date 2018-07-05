
# Resize the disk partition
$maxPartitionSize = (Get-PartitionSupportedSize -DriveLetter c).sizeMax
Resize-Partition -DriveLetter c -Size $maxPartitionSize -ErrorAction Continue

# Set the timezone
Set-TimeZone "AUS Eastern Standard Time"

# Fix "An App Default Was Reset" Error on Windows 10
# https://www.drivethelife.com/windows-10/an-app-default-was-reset-error-windows-10.html
get-appxpackage *zunevideo* | remove-appxpackage
get-appxpackage *zunemusic* | remove-appxpackage
get-appxpackage *photos* | remove-appxpackage
get-appxpackage *windowsstore* | remove-appxpackage
get-appxpackage *windowsphone* | remove-appxpackage
get-appxpackage *xboxapp* | remove-appxpackage
