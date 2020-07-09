#!bin/sh

	sudo -i
	apt install -y git

	cd /var/www/html
	git clone https://github.com/website-project-WP/free-wp.git
	
	chown -R www-data:www-data /var/www/html/*
	echo -e "EDIT THE FILE ON FOLDER [SITE.TLD]/configuration/sites.php\n"
	echo -e "WITH FTP OR SFTP\n"
	echo -e "$sites['name'] #Personal/Compagny name\n"
	echo -e "$sites['domain'] #your-domain.tld"
	echo -e "Open your browser and access your domaine-name.tld | DONE!!!!:) "
	echo -e "Custom all <<Configuration>> & <<themes>> folder "
	echo -e "You can Make a donation @AlexonbStudio, bye"
	
sleep 30
exit && exit 