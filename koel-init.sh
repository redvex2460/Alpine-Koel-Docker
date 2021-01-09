#!/bin/sh
if test -f ".installed"; then
    php artisan serve --host 0.0.0.0
else
    composer install
    #Edit env File
    #Edit database related Vars
    sed -i "s/DB_CONNECTION=.*/DB_CONNECTION=$DB_CONNECTION/" /var/www/koel/.env
    sed -i "s/DB_HOST=.*/DB_HOST=$DB_HOST/" /var/www/koel/.env
    sed -i "s/DB_PORT=.*/DB_PORT=$DB_PORT/" /var/www/koel/.env
    sed -i "s/DB_DATABASE=.*/DB_DATABASE=$DB_DATABASE/" /var/www/koel/.env
    sed -i "s/DB_USERNAME=.*/DB_USERNAME=$DB_USERNAME/" /var/www/koel/.env
    sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=$DB_PASSWORD/" /var/www/koel/.env
    #Edit Admin related vars
    sed -i "s/ADMIN_NAME=.*/ADMIN_NAME=\"$ADMIN_NAME\"/" /var/www/koel/.env
    sed -i "s/ADMIN_EMAIL=.*/ADMIN_EMAIL=\"$ADMIN_EMAIL\"/" /var/www/koel/.env
    sed -i "s/ADMIN_PASSWORD=.*/ADMIN_PASSWORD=$ADMIN_PASSWORD/" /var/www/koel/.env
    #Generate Database
    if [ $DB_CONNECTION = "sqlite-persistent" ]; then    
        sqlite3 $DB_DATABASE "VACUUM;"
    fi
    php artisan koel:init --no-interaction
    touch .installed
    printf "$ADMIN_PASSWORD\n$ADMIN_PASSWORD" | php artisan koel:admin:change-password
    php artisan serve --host 0.0.0.0
fi