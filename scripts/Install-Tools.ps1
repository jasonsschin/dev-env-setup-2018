Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
Install-PackageProvider -Name Nuget -Force

$software = @(
    'git',
    'conemu',
    'googlechrome',
    'sublimetext3',
    'postman',
    'DotPeek',
    '7Zip',
    'Fiddler',
    'netfx-4.7-devpack',
    'webpi'
)

$optionalSoftware = @(
    'resharper',
    'boxstarter'
)

foreach ($s in  $software) {
    choco install $s -yes
}

Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force



