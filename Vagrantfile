Vagrant.configure("2") do |config|
  config.vm.define "staging"
  config.vm.box = "generic/ubuntu2204"

  config.vm.network "private_network", ip: "192.168.56.3"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = "4096"
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "bootstrap.yml"
  end
end
