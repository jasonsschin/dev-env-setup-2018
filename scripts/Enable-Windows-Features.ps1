Set-ExecutionPolicy Bypass -Scope Process

# Enable ".NET Framework 3.5 (includes .NET 2.0 and 3.0"
Enable-WindowsOptionalFeature -Online -FeatureName NetFx3
Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-HTTP-Activation 
Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-NonHTTP-Activation

# Enable ".NET Framework 4.6 Advanced Services"
Enable-WindowsOptionalFeature -Online -FeatureName WCF-Services45
Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-HTTP-Activation45
Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-TCP-Activation45
Enable-WindowsOptionalFeature -Online -All -FeatureName WCF-TCP-PortSharing45

# Enable "Active Directory Lightweight Directory Services"
Enable-WindowsOptionalFeature -Online -FeatureName DirectoryServices-ADAM-Client

# Enable "Internet Information Services"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementService

# Enable "Application Development Features"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment
Enable-WindowsOptionalFeature -Online -All -FeatureName NetFx4Extended-ASPNET45
Enable-WindowsOptionalFeature -Online -All -FeatureName IIS-NetFxExtensibility
Enable-WindowsOptionalFeature -Online -ALl -FeatureName IIS-NetFxExtensibility45
# Disable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
# Disable-WindowsOptionalFeature -Online -FeatureName IIS-ASP
Enable-WindowsOptionalFeature -Online -All -FeatureName IIS-ASPNET
Enable-WindowsOptionalFeature -Online -All -FeatureName IIS-ASPNET45
# Disable-WindowsOptionalFeature -Online -FeatureName IIS-CGI
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter
# Disable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets

# Enable "Common HTTP Features"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument
Enable-WindowsOptionalFeature -Online -FeatureName IIS-DirectoryBrowsing
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpRedirect
Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent
#Disable-WindowsOptionalFeature -Online -FeatureName IIS-WebDAV

# Enable "Health and Diagnostics"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
# Disable-WindowsOptionalFeature -Online -FeatureName IIS-CustomLogging
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging
Enable-WindowsOptionalFeature -Online -FeatureName IIS-LoggingLibraries
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing

# Enable "Performance Features"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance
Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic

# Enable "Security"
Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security
# Disable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
#IIS-CertProvider                            Disabled
#IIS-ClientCertificateMappingAuthentication  Disabled
#IIS-DigestAuthentication                    Disabled
#IIS-IISCertificateMappingAuthentication     Disabled
#IIS-IPSecurity                              Disabled
Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering
#IIS-URLAuthorization                        Disabled
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WindowsAuthentication




