**ACTUAL SETUP CANT BE DONE WITH VAGRANT THIS IS JUST FOR TESTING**  

Trying the Vulnerabilities setup.  
Saving commands here in case I forget them.  

sudo apt update  
sudo apt install apache2 mariadb-server php php-mysql php-fpm -y  
sudo apt install php-xml
sudo mysql_secure_installation  
    
        vagrant  
        no  
        no  
        yes
        yes
        yes
        yes

sudo mysql  
CREATE DATABASE wordpress_DB;  
CREATE USER 'wordpress_user'@'localhost' IDENTIFIED BY 'password';  
GRANT ALL PRIVILEGES ON wordpress_DB.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';  
FLUSH PRIVILEGES;  
exit  

mysql -uwordpress_user -ppassword  
SHOW DATABASES;
exit

sudo wget https://wordpress.org/wordpress-5.0.tar.gz  
tar -xvzf wordpress-5.0.tar.gz  
sudo mv wordpress /var/www/html/wordpress  
sudo chown -R www-data:www-data /var/www/html/wordpress/  
sudo chmod -R 755 /var/www/html/wordpress/  
sudo nano /etc/apache2/sites-enabled/000-default.conf  

        DocumentRoot /var/www/html/wordpress

sudo systemctl reload apache2  

Database name: wordpress_DB  
Username: wordpress_user  
Password: password  
Database Host: localhost  
Table prefix: wp_  

Pieter  
Pieter  
Pieter  
Pieter.deconinck@student.hogent.be  

Wordpress install is done.