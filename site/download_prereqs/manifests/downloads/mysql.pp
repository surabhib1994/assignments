class download_prereqs::downloads::mysql
{
file { "C:\\Users\\Surabhi\\Documents\\assignment-1\\assignments\\packages\\mysql-installer-community-8.0.22.0.msi": 
      source     =>  'https://dev.mysql.com/get/Downloads/MySQLInstaller/mysql-installer-community-8.0.22.0.msi'
     }
}