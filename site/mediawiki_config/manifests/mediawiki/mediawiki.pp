class mediawiki_config::mediawiki::mediawiki {
  $mediawiki = "mediawiki-1.35.1.tar.gz"
  $on_disk = "C:\\packages\\$mediawiki"
  
  file{ $on_disk:
    ensure => present,
	source => 'C:\\packages\\mediawiki-1.35.1'
	destination => "C:\inetpub\wwwroot\mediawiki"
    }  
}