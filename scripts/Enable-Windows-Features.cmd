::# Enable ".NET Framework 3.5 (includes .NET 2.0 and 3.0"
Dism /online /Enable-Feature /FeatureName:NetFx3
Dism /online /Enable-Feature /FeatureName:WCF-HTTP-Activation /All
Dism /online /Enable-Feature /FeatureName:WCF-NonHTTP-Activation /All

::# Enable ".NET Framework 4.6 Advanced Services"
Dism /online /Enable-Feature /FeatureName:WCF-Services45
Dism /online /Enable-Feature /FeatureName:WCF-HTTP-Activation45 /All
Dism /online /Enable-Feature /FeatureName:WCF-TCP-Activation45 /All
Dism /online /Enable-Feature /FeatureName:WCF-TCP-PortSharing45 

::# Enable "Active Directory Lightweight Directory Services"
Dism /online /Enable-Feature /FeatureName:DirectoryServices-ADAM-Client

::# Enable "Internet Information Services"
Dism /online /Enable-Feature /FeatureName:IIS-WebServerRole
Dism /online /Enable-Feature /FeatureName:IIS-WebServer
Dism /online /Enable-Feature /FeatureName:IIS-WebServerManagementTools
Dism /online /Enable-Feature /FeatureName:IIS-IIS6ManagementCompatibility
Dism /online /Enable-Feature /FeatureName:IIS-Metabase
Dism /online /Enable-Feature /FeatureName:IIS-ManagementConsole
Dism /online /Enable-Feature /FeatureName:IIS-WebServerManagementTools
Dism /online /Enable-Feature /FeatureName:IIS-ManagementScriptingTools
Dism /online /Enable-Feature /FeatureName:IIS-ManagementService /All

::# Enable "Application Development Features"
Dism /online /Enable-Feature /FeatureName:IIS-ApplicationDevelopment
Dism /online /Enable-Feature /FeatureName:NetFx4Extended-ASPNET45
Dism /online /Enable-Feature /FeatureName:IIS-NetFxExtensibility /All
Dism /online /Enable-Feature /FeatureName:IIS-NetFxExtensibility45 /All
:: Disable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
:: Disable-WindowsOptionalFeature -Online -FeatureName IIS-ASP
Dism /online /Enable-Feature /FeatureName:IIS-ASPNET /All
Dism /online /Enable-Feature /FeatureName:IIS-ASPNET45 /All
:: Disable-WindowsOptionalFeature -Online -FeatureName IIS-CGI
Dism /online /Enable-Feature /FeatureName:IIS-ISAPIExtensions
Dism /online /Enable-Feature /FeatureName:IIS-ISAPIFilter
:: Disable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes
Dism /online /Enable-Feature /FeatureName:IIS-WebSockets

:: # Enable "Common HTTP Features"
Dism /online /Enable-Feature /FeatureName:IIS-CommonHttpFeatures
Dism /online /Enable-Feature /FeatureName:IIS-DefaultDocument
Dism /online /Enable-Feature /FeatureName:IIS-DirectoryBrowsing
Dism /online /Enable-Feature /FeatureName:IIS-HttpErrors
Dism /online /Enable-Feature /FeatureName:IIS-HttpRedirect
Dism /online /Enable-Feature /FeatureName:IIS-StaticContent
:: Disable-WindowsOptionalFeature -Online -FeatureName IIS-WebDAV

:: # Enable "Health and Diagnostics"
Dism /online /Enable-Feature /FeatureName:IIS-HealthAndDiagnostics
:: Disable-WindowsOptionalFeature -Online -FeatureName IIS-CustomLogging
Dism /online /Enable-Feature /FeatureName:IIS-HttpLogging
Dism /online /Enable-Feature /FeatureName:IIS-LoggingLibraries
Dism /online /Enable-Feature /FeatureName:IIS-RequestMonitor
Dism /online /Enable-Feature /FeatureName:IIS-HttpTracing

:: # Enable "Performance Features"
Dism /online /Enable-Feature /FeatureName:IIS-Performance
Dism /online /Enable-Feature /FeatureName:IIS-HttpCompressionStatic

:: # Enable "Security"
Dism /online /Enable-Feature /FeatureName:IIS-Security
:: Disable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
:: #IIS-CertProvider                            Disabled
:: #IIS-ClientCertificateMappingAuthentication  Disabled
:: #IIS-DigestAuthentication                    Disabled
:: #IIS-IISCertificateMappingAuthentication     Disabled
:: #IIS-IPSecurity                              Disabled
Dism /online /Enable-Feature /FeatureName:IIS-RequestFiltering
:: #IIS-URLAuthorization                        Disabled
Dism /online /Enable-Feature /FeatureName:IIS-WindowsAuthentication




