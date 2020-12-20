<powershell>
Set-ExecutionPolicy Bypass -Scope Process -Force; 
$client = new-object System.Net.WebClient
$client.DownloadFile("https://github.com/git-for-windows/git/releases/download/v2.29.2.windows.3/Git-2.29.2.3-64-bit.exe" , "C:\puppet\Git-2.29.2.3-64-bit.exe")                  
Write-Host "Installing git"
Invoke-Expression "& 'C:\puppet\Git-2.29.2.3-64-bit.exe' /q  /norestart"
Write-Host "Installing Puppet"
$client.DownloadFile("http://downloads.puppetlabs.com/windows/puppet-3.8.7.msi","C:\puppet\puppet-3.8.7.msi")
msiexec /qn /norestart /i C:\puppet\puppet-3.8.7.msi  
Write-Host "Cloning puppet repo"
git clone https://github.com/surabhib1994/assignments.git c:\puppet  
Write-Host "Calling puppetapply script"
C:\Users\Surabhi\Documents\assignment-1\assignments\install-mediawiki.ps1    
Write-Host "Replacing php.ini file with correct config ini file"
Copy-Item -Path 'C:\Users\Surabhi\Documents\assignment-1\assignments\packages\php.ini' -Destination 'C:\Users\Surabhi\Documents\assignment-1\assignments\packages\php-8.0.0-nts-Win32-vs16-x64\php.ini' -Force
Write-Host "Adding permissions to files"
$hostname=hostname
$acl = Get-Acl C:\packages\mediawiki-1.35.1\images
$permission = "$hostname\IUSR","FullControl","Allow","ContainerInherit"
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
$acl.SetAccessRule($accessRule)
$acl | Set-Acl C:\packages\mediawiki-1.35.1\images
$acl2 = Get-Acl C:\Windows\Temp
$permission2 = "$hostname\IUSR","FullControl","Allow","ContainerInherit"
$accessRule2 = New-Object System.Security.AccessControl.FileSystemAccessRule $permission2
$acl2.SetAccessRule($accessRule2)
$acl2 | Set-Acl C:\Windows\Temp
Write-Host "Creating phpinfo.php file"
New-Item -Path 'C:\inetpub\wwwroot\phpinfo.php' -ItemType File
Add-Content C:\inetpub\wwwroot\phpinfo.php "<?php phpinfo();"
Write-Host "Adding PHP as FastCGI application"
New-WebHandler -Name "PHP-FastCGI" -Path "*.php" -Verb "*" -Modules "FastCgiModule" -ScriptProcessor "c:\php\php-cgi.exe" -ResourceType File
[system.Diagnostics.Process]::Start("iexplore","http://$hostname/mediawiki/mw-config/index.php")
</powershell>

