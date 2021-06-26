# README

This script:

* Updates and upgrades apt
* Installs ufw
* Creates a new user with the same key as root (the username is the second parameter, and ssh key is the third parameter)
* Changes the host name (the hostname is the first parameter)
* Disables passwords and root logins for SSH
* Configures the firewall to allow SSH and enables it

To run the script, login as root:
```shell
./ubuntu_setup/ubuntu_setup.sh <host> <user> "<rsa key>"
```
Quotes are required around the rsa key because it contains spaces

The script will create backup hosts and ssh config files in root's home directory

To copy the public rsa kay run the following on the local machine and copy it as the third parameter:
```shell
cat ~/.ssh/id_rsa.pub
```

