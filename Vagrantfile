Vagrant.configure("2") do |config|
  config.vm.box = "bionic-v4.#{Time.new.strftime('%Y%m%d')}"
  # config.ssh.password = "vagrant"
  config.ssh.private_key_path = "~/.ssh/vagrant_rsa"
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.memory = 512
    v.cpus = 1
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    v.customize [
      "guestproperty",
      "set",
      :id,
      "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold",
      10_000
    ]
  end
end
