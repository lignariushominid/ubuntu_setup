# README

This script:

* Updates and upgrades apt
* Installs ufw
* Creates a new user with the same key as root (the username is the second parameter, their password is the third parameter, and ssh key is the third parameter)
* Changes the host name (the hostname is the first parameter)
* Disables passwords and root logins for SSH
* Configures the firewall to allow SSH and enables it

To run the script, login as root:
```shell
./ubuntu_setup/ubuntu_setup.sh <host> <user> <password> "<rsa key>"
```
Quotes are required around the rsa key because it contains spaces

The script will create backup hosts and ssh config files in root's home directory

To copy the public rsa kay run the following on the local machine and copy it as the third parameter:
```shell
cat ~/.ssh/id_rsa.pub
```

The developer token needed to login to Github can be regenerated here on the Github website:

__Settings__>__Developer settings__>__Personal access tokens__

