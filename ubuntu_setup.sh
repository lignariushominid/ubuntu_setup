#!/bin/bash

if [ ! -n "$1" ] ; then
	echo 'Missing argument one: new hostname'
	exit 1
fi


if [ ! -n "$2" ] ; then
	echo 'Missing argument two: userid'
	exit 1
fi


if [ "$(id -u)" != "0" ] ; then
	echo 'Sorry you are not root'
	exit 1
fi

apt update
apt upgrade -y
apt install -y ufw

CUR_HOSTNAME=$(cat /etc/hostname)
NEW_HOSTNAME=$1
USERID=$2

echo "The current hostname is: $CUR_HOSTNAME"
echo "The new hostname is:     $NEW_HOSTNAME"
echo "The userid is:           $USERID"

adduser --disabled-password --gecos "" $USERID
adduser $USERID sudo
mkdir /home/$USERID/.ssh
chmod -R 700 /home/$USERID/.ssh
cp ~/.ssh/authorised_keys /home/$USERID/.ssh/authorised_keys
echo "User created"

hostnamectl set-hostname $NEW_HOSTNAME 
cp /etc/hosts ./hosts_backup
sudo sed -i 's/127.0.0.1 localhost/127.0.0.1 $NEW_HOSTNAME.boardman.io $NEW_HOSTNAME/' /etc/hosts
echo "Hostname updated to: $(cat /etc/hostname)"

timedatectl set-timezone Europe/London
echo "Timezone set to: $(timedatectl)"

cp /etc/ssh/sshd_config ./sshd_config_backup
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
echo "SSH root login and passwords disabled"

ufw allow ssh
echo "y" | ufw enable
ufw status

echo '** NOW REBOOT **'
