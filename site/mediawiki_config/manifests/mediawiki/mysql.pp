class mediawiki_config::mediawiki::mysql {
  $deploy = "mysql-installer-community-8.0.22.0.msi"
  $on_disk = "C:\\Users\\Surabhi\\Documents\\assignment-1\\assignments\\packages\\$deploy"
  
  file{ $on_disk:
    ensure => present,
	source => 'C:\\Users\\Surabhi\\Documents\\assignment-1\\assignments\\packages\\\mysql-installer-community-8.0.22.0.msi'
    }  
  package {"mysql installation" : 
    ensure => present,
	source => $on_disk
	install_options => ['/q' , '/norestart']
	}
}

class { '::mysql::server':
  root_password    => 'strongpassword',
  override_options => { 'mysqld' => { 'max_connections' => '1024' } }
