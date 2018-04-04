sleep 30

mysqladmin create wordpress 
wp core config --dbname=wordpress --dbuser=root --dbpass="" --allow-root 
wp core install --url=http://localhost --title="Test Wordpress" --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root

rm -rf /app/wp-config-sample.php /app/wp-admin/install*.php 

chmod -R 777 /app 
rm -f /etc/supervisor/conf.d/supervisord-zwordpress.conf