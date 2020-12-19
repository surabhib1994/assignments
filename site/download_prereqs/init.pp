class download_prereqs {
contain('download_prereqs::downloads::visualc')
contain('download_prereqs::downloads::mysql')
contain('download_prereqs::downloads::php')
contain('download_prereqs::downloads::mediawiki')

Class['download_prereqs::downloads::visualc']
-> Class['download_prereqs::downloads::mysql']
-> Class['download_prereqs::downloads::php']
-> Class['download_prereqs::downloads::mediawiki']
}