class profiles::config {
contain('download_pre_reqs')
contain('iis')
contain('mediawiki_config')

Class['download_pre_reqs']
->class['iis']
->class['mediawiki_config']
}