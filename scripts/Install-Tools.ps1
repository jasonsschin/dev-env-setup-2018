Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
Install-PackageProvider -Name Nuget -Force

$software = @(
    'git',
    'conemu',
    'googlechrome',
    'sublimetext3',
    'DotPeek',
    '7Zip',
    'Fiddler',
    'netfx-4.6.1-devpack',
    'netfx-4.7-devpack',
    'netfx-4.7.1-devpack',
    'webpi',
    'linqpad',
    'procmon',
    'cmder'
)

$optionalSoftware = @(
    'resharper',
    'boxstarter',
    'sysinternals'
)

foreach ($s in  $software) {
    choco install $s -yes
}

Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser -Force



