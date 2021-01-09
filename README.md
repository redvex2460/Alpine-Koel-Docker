<<<<<<< HEAD
# Alpine-Koel-Docker
=======
# Alpine-Koel-Docker

This repo is created for using with UnRaid. 

I've created it on a UnRaid 6.8.2

## How to install


1. SSH into your unraid server.
2. Enter "cd /boot/config/plugins/dockerMan/templates-user/"
3. Enter "wget https://raw.githubusercontent.com/redvex2460/Alpine-Koel-Docker/main/my-koel.xml"
4. Open your UnRaid WebUI
5. Goto Docker
6. Add Container
7. Select the "User-Template" Koel
8. Fill in the Variables
9. Start Container

## Variables

- DB_CONNECTION : Defines the connection driver PHP uses to connect to the Database
- DB_HOST : Used for MySQL Host
- DB_PORT : Used for MySQL Port
- DB_DATABASE : MySQL Database or if sqlite-persistent is used defines the absolute filepath for Database
- DB_USERNAME : Used for MySQL Username
- DB_PASSWORD : Used for MySQL Password
- ADMIN_NAME : defines the Admin Name "Max Mustermann"
- ADMIN_EMAIL : defines the Admin Mail - used for login
- ADMIN_PASSWORD: defines the Admin Password
- Web-Port : Port used on Unraid for WebUI
- Music : defines the Local Music folder to index.
- Appdata : defines the Volumepath to be mounted. default: /mnt/user/appdata alpine-koel-music
>>>>>>> 0c7abb435f2b592a07d1acd3fec453073c9d0e57
