https://help.ubuntu.com/lts/installation-guide/amd64/apbs04.html

```shell
vagrant box add --provider virtualbox --name bionic-v3 ./ubuntu-18-04-x64-virtualbox.box
vagrant up
vagrant ssh
vagrant destroy -f
vagrant box remove bionic-v3
```
