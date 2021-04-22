Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.box = "centos/7"
    config.vm.provider "virtualbox" do |vb|

        vb.name = "panda"
  end
  config.vm.define "panda", primary: true do |master|
    master.vm.network "private_network", ip: "192.168.56.5"
    master.vm.provider "virtualbox" do |vb|
      vb.name = "panda"
      vb.memory = 2048
      vb.cpus = 1
    end
    master.vm.hostname = "panda"
  end

end