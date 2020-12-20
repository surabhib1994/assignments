<powershell>
$client = new-object System.Net.WebClient
$client.DownloadFile("https://github.com/git-for-windows/git/releases/download/v2.29.2.windows.3/Git-2.29.2.3-64-bit.exe" , "C:\puppet\Git-2.29.2.3-64-bit.exe")                                    #installing git
Invoke-Expression "& 'C:\puppet\Git-2.29.2.3-64-bit.exe' /q  /norestart"
git clone https://github.com/surabhib1994/assignments.git c:\puppet
$client.DownloadFile("http://downloads.puppetlabs.com/windows/puppet-3.8.7.msi","C:\puppet\puppet-3.8.7.msi")
msiexec /qn /norestart /i C:\puppet\puppet-3.8.7.msi                             #installing puppet
C:\Users\Surabhi\Documents\assignment-1\assignments\install-mediawiki.ps1    #calling puppetapply script
Copy-Item -Path 'C:\Users\Surabhi\Documents\assignment-1\assignments\packages\php.ini' -Destination 'C:\Users\Surabhi\Documents\assignment-1\assignments\packages\php-8.0.0-nts-Win32-vs16-x64\php.ini' -Force
</powershell>

