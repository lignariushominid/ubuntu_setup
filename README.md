# README

This script:

* Updates and upgrades apt
* Installs ufw
* Creates a new user with the same key as root (the username is the second parameter)
* Changes the host name (the hostname is the first parameter)
* Disables passwords and root logins for SSH
* Configures the firewall to allow SSH and enables it

To run the script, login as root:
```shell
./ubuntu_setup/ubuntu_setup.sh <host> <user>
```

The script will create backup hosts and ssh config files in root's home directory
