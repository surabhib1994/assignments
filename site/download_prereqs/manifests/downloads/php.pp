class download_prereqs::downloads::php
{
file { "C:\\Users\\Surabhi\\Documents\\assignment-1\\assignments\\packages\\php-8.0.0-nts-Win32-vs16-x64.zip": 
      source     =>  'https://windows.php.net/downloads/releases/php-8.0.0-nts-Win32-vs16-x64.zip'
     }

unzip { "php"
        source   =>   "C:/Users/Surabhi/Documents/assignment-1/assignments/packages/php-8.0.0-nts-Win32-vs16-x64.zip" , 
		creates  =>   "C:/Click",
		destination => "C:/Users/Surabhi/Documents/assignment-1/assignments/packages/"
	  }
}
