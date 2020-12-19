class mediawiki_config::mediawiki::php {
  $php = "php.exe"
  $on_disk = "C:\\Users\\Surabhi\\Documents\\amdocs_assignment\\packages\\php-8.0.0-nts-Win32-vs16-x64\\$php"
  
  file{ $on_disk:
    ensure => present,
	source => 'C:\\Users\\Surabhi\\Documents\\amdocs_assignment\\packages\\php-8.0.0-nts-Win32-vs16-x64\\php.exe'
    }  
  package {"php installation" : 
    ensure => present,
	source => $on_disk
	install_options => ['/q']
	}
}