class mediawiki_config::mediawiki::mediawiki {
  $mediawiki = "mediawiki-1.35.1.tar.gz"
  $on_disk = "C:\\Users\\Surabhi\\Documents\\amdocs_assignment\\packages\\mediawiki-1.35.1\\$mediawiki"
  
  file{ $on_disk:
    ensure => present,
	source => 'C:\\Users\\Surabhi\\Documents\\amdocs_assignment\\packages\\mediawiki-1.35.1\\mediawiki-1.35.1'
	destination => "c:\\inetpub\\wwwroot"
    }  
}