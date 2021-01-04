class profiles::config {
contain('download_prereqs')
contain('iis')
contain('mediawiki_config')

Class['download_prereqs']
->Class['iis']
->Class['mediawiki_config']
}