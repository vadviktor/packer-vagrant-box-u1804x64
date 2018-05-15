# vagrant box add --provider virtualbox --name bionictest ./ubuntu-18-04-x64-virtualbox.box
# vagrant up
# vagrant ssh
# vagrant destroy -f
# vagrant box remove bionictest

Vagrant.configure("2") do |config|
  config.vm.box = "bionictest"
  config.ssh.private_key_path = "~/.ssh/vagrant_rsa"

  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.memory = 512
    v.cpus = 1
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
  end
end
