#!/bin/bash

sudo yum -y install npm
sudo yum -y install httpd
sudo yum -y install php php-cli php-common php-fpm php-xml php-mysqlnd php-gd php-curl php-json php-mbstring php-zip php-intl

FILE="/home/ec2-user/startbootstrap-shop-homepage/scripts/*"

if [ -f "$FILE" ]; then
    echo "$FILE exists. Deleting..."
    rm "$FILE"
fi

# Now proceed with your deployment or file creation
echo "Creating $FILE..."
# touch "$FILE" # or your deployment command


HTTPD_FILE="/home/ec2-user/startbootstrap-shop-homepage/scripts/config_httpd"

# A 파일의 내용을 변수에 저장
HTTPD_CONTENT=$(cat "$HTTPD_FILE")

# /etc/httpd/conf/httpd.conf 파일에 HTTPD 파일의 내용을 덮어쓰기
echo "$HTTPD_CONTENT" | sudo tee /etc/httpd/conf/httpd.conf > /dev/null

sudo systemctl restart httpd

