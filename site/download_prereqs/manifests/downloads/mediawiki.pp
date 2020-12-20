class download_prereqs::downloads::mediawiki
{
file { "C:\\Users\\Surabhi\\Documents\\assignment-1\\assignments\\packages\\mediawiki-1.35.1.tar.gz": 
      source     =>  'https://releases.wikimedia.org/mediawiki/1.35/mediawiki-1.35.1.tar.gz'
     }
unzip { "mediawiki"
        source   =>   "C:/Users/Surabhi/Documents/assignment-1/assignments/packages/mediawiki-1.35.1.tar.gz" , 
		creates  =>   "C:/Click",
		destination => "C:/packages/"
	  }
}