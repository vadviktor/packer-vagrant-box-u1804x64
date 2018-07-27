```
vagrant box add --provider virtualbox --name bionictest ./ubuntu-18-04-x64-virtualbox.box
vagrant up
vagrant ssh
vagrant destroy -f
vagrant box remove bionictest
```
