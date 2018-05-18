 $driveMappings = @{
    D ='\\Mac\Projects'
    X ='\\Mac\vagrant'
    Z ='\\Mac\Downloads'
 }

 # Remove all default vagrant mapped network shares, for some reason Remove-PSDrive does not work
 Get-PSDrive -PSProvider FileSystem | ? {$_.DisplayRoot -match '\\Mac'} | % {net use  "$($_.Name):" /delete /y}

 # Re-map all network shares based off lookup definition
 $driveMappings.GetEnumerator() | ForEach-Object{
   New-PSDrive –Name $_.Key –PSProvider FileSystem -Root $_.Value -Persist
 }


