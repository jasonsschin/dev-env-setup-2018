$paths = @(
	'\\mac\projects\anz',
	'\\mac\projects\anz\lib-fileactive'
	'\\mac\projects\anz\Core'
	'\\mac\projects\anz\PSI',
    '\\mac\projects\anz\nas\Applications',
    '\\mac\projects\anz\nas\Process\ContentStore',
    '\\mac\projects\anz\nas\Customer',
    '\\mac\projects\anz\nas\Process',
    '\\mac\projects\anz\nas\Working'
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




