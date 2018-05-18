
# Resize the disk partition
$maxPartitionSize = (Get-PartitionSupportedSize -DriveLetter c).sizeMax
Resize-Partition -DriveLetter c -Size $maxPartitionSize

# Set the timezone
Set-TimeZone "AUS Eastern Standard Time"