#!/bin/bash

mv /usr/local/tomcat/webapps/ROOT/index.jsp /usr/local/tomcat/webapps/ROOT/index.jsp-dist
wget https://raw.githubusercontent.com/FortiLatam/log4j-shell-poc/main/vulnerable-application/src/main/webapp/logo_SG.png -P /usr/local/tomcat/webapps/ROOT/
wget https://raw.githubusercontent.com/FortiLatam/log4j-shell-poc/main/vulnerable-application/src/main/webapp/index.jsp -P /usr/local/tomcat/webapps/ROOT/

apt update
apt install cron -y
systemctl enable cron
systemctl start cron
/bin/bash -c 'echo "*/1 * * * * root /bin/bash /root/custom.sh" >> /etc/crontab'
