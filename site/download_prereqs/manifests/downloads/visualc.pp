class download_prereqs::downloads::visualc
{
file { "C:\\Users\\Surabhi\\Documents\\assignment-1\\assignments\\packages\\vcredist_x64.exe": 
      source     =>  'https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe'
     }
unzip { "visualc"
        source   =>   "C:/Users/Surabhi/Documents/assignment-1/assignments/packages/vcredist_x64.exe" , 
		creates  =>   "C:/Click",
		destination => "C:/Users/Surabhi/Documents/assignment-1/assignments/packages/"
	  }
}
