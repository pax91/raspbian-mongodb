#!/bin/bash
echo " ___________________________________________________________________________ "
echo "|                       MONGODB INSTALLATION SCRIPT                         |"
echo "|                          v5.0.5 ARM64 raspbian                            |"
echo "|                              © made by PAX                                |"
echo "|___________________________________________________________________________|"
echo ""
if [ "$EUID" -ne 0 ]
  then echo "############### PLEASE RUN SCRIPT WITH SUDO ###############"
  read ans
  exit 0
fi
if (systemctl list-units --full -all | grep mongodb); then
    echo "-> MONGODB already installed"
    exit 0
fi
echo "-> Start Downloading files ..."
FILES=("raspbian_mongodb_5.0.5.gz" "mongodb.conf" "mongodb.service") 
for file in ${FILES[@]}; do
    wget -O $file https://raw.githubusercontent.com/pax91/raspbian-mongodb/main/$file -q --show-progress
done
for req in ${FILES[@]}; do
    if [ ! -f "$req" ]; then
        echo "ERROR: $req installation file missing"
        exit 0
    fi
done
echo "-> MONGODB Install Start"
adduser --no-create-home --disabled-login mongodb --gecos "Mongodb"
tar zxvf raspbian_mongodb_5.0.5.gz
cp mongodb.conf /etc/mongodb.conf
echo "-> mongodb.conf copied"
cp mongodb.service /lib/systemd/system/mongodb.service
echo "-> mongodb.service copied"
mv mongo* /usr/bin
chown root:root /usr/bin/mongo*
chmod 755 /usr/bin/mongo*
echo "-> mongodb files moved to /usr/bin"
mkdir -p /var/log/mongodb/
chown -R mongodb:mongodb /var/log/mongodb/
echo "-> /var/log/mongodb folder created"
mkdir /data
chmod 777 /data
mkdir -p /data/db
chown -R mongodb:mongodb /data/db
echo "-> /data/db folder created"
systemctl daemon-reload
systemctl enable mongodb.service
echo "-> mongodb.service enabled"
systemctl start mongodb.service
echo "-> mongodb service started"
echo " ___________________________________________________________________________ "
echo "|                     MONGODB INSTALLATION COMPLETED                        |"
echo "|___________________________________________________________________________|"