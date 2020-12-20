class mediawiki_config::mediawiki::visualc {
  $vcdeploy = "vcredist_x64.exe"
  $on_disk = "C:\\packages\\$vcdeploy"
  
  file{ $on_disk:
    ensure => present,
	source => 'C:\\packages\\vcredist_x64.exe'
    }  
  package {"visual c redistributable installation" : 
    ensure => present,
	source => $on_disk
	install_options => ['/q']
	}
}