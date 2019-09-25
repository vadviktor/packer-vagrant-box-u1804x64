https://help.ubuntu.com/lts/installation-guide/amd64/apbs04.html

```shell
rm -f ./ubuntu-18-04-x64-virtualbox.box && \
packer build template.json && \
export TODAY=$(date +"%Y%m%d") && \
vagrant box add --provider virtualbox --name bionic-v4.${TODAY} ./ubuntu-18-04-x64-virtualbox.box && \
vagrant up && \
vagrant ssh && \
vagrant destroy -f && \
vagrant box remove bionic-v4.${TODAY}
```
