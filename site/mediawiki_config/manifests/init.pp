class mediawiki_config {
contain('mediawiki_config::mediawiki::visualc')
contain('mediawiki_config::mediawiki::mysql')
contain('mediawiki_config::mediawiki::php')
contain('mediawiki_config::mediawiki::mediawiki')

Class['mediawiki_config::mediawiki::visualc']
-> Class['mediawiki_config::mediawiki::mysql']
-> Class['mediawiki_config::mediawiki::php']
-> Class['mediawiki_config::mediawiki::mediawiki']
}