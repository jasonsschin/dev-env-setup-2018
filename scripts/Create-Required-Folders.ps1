$paths = @(
	'\\mac\projects\anz',
	'\\mac\projects\anz\lib-fileactive'
)

 Get-PSDrive -PSProvider Filesystem

foreach ($p in $paths){
	if (-Not (Test-Path $p)){
		Write-Host "Folder $($p) does not exist. Creating folder $($p)."  -foreground Green
		New-Item -ItemType Directory -Path $p
	}
	else
	{
		Write-Host "Folder $($p) already exists."  -foreground Green
	}
}




