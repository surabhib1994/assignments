class iis::software::iisfeature {
 exec {'IIS Feature Installation' :
 path => 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0',
command => "powershell Install-WindowsFeature IIS-WebServerRole, IIS-WebServer, IIS-CommonHttpFeatures, IIS-HttpErrors, IIS-HttpRedirect, IIS-ApplicationDevelopment, NetFx4Extended-ASPNET45, IIS-NetFxExtensibility45, IIS-HealthAndDiagnostics, IIS-HttpLogging, IIS-LoggingLibraries, IIS-RequestMonitor, IIS-HttpTracing, IIS-Security, IIS-RequestFiltering, IIS-Performance, IIS-WebServerManagementTools, IIS-IIS6ManagementCompatibility, IIS-CGI, IIS-Metabase, IIS-ManagementConsole, IIS-BasicAuthentication, IIS-WindowsAuthentication, IIS-StaticContent, IIS-DefaultDocument, IIS-WebSockets, IIS-ApplicationInit, IIS-ISAPIExtensions, IIS-ISAPIFilter, IIS-HttpCompressionStatic, IIS-ASPNET45, IIS-ASPNET35 -IncludeAllSubFeature"
timeout => 0
}
}