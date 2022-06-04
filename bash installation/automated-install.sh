# Please run me in Root
# Installing common distributables

apt install sudo                  # Sudo 
sudo apt install ssh fail2ban                  # SSH & SERVICES 
sudo apt install gnupg htop git wget curl apt-transport-https software-properties-common gnupg2                # Common Necessities
sudo apt install nginx                   # Web Service
sudo apt install python3-certbot-dns-cloudflare                 # Certbot 
# sudo apt install ufw                 # FireWall (Not Required)

# Halting Nginx
systemctl stop nginx

# Unlink the old NGINX configuration.
unlink /etc/nginx/sites-enabled/default

# Fetching Latest Nginx Configuration

cd /etc/nginx/conf.d
wget https://raw.githubusercontent.com/ZEROPOINTBRUH/Krew.io-Source/main/nginx%20config/krew.conf

# Preparing Certificates to be setup manully
mkdir /root/.secrets/
touch /root/.secrets/cloudflare.ini
cd /root/.secrets/
wget https://raw.githubusercontent.com/ZEROPOINTBRUH/Krew.io-Source/main/certbot/cloudflare.ini

# Now It must be a secret right?
sudo chmod 0700 /root/.secrets/
sudo chmod 0400 /root/.secrets/cloudflare.ini

# Fetching Required Third Party Packages
cd /home
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | tee /etc/apt/sources.list.d/mongodb-org.list
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
sudo apt update

sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt update

# Install common third party distributables
sudo apt install mongodb-org # MongoDb 4.4
sudo apt -y install nodejs # NodeJs 14.16.0

# Update Everything
sudo apt update -y && sudo apt upgrade -y && sudo apt full-upgrade -y

# Installation Complete

# Credits
echo ====================Credits=========================
echo This script was built by zeropoint#9798
echo Dm Me at any time
echo My Contact Email is wegj1@hotmail.com
echo ====================Credits=========================