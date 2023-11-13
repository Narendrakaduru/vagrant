Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.box = "bento/ubuntu-22.04"
    master.vm.network "private_network", type: "static", ip: "192.168.10.120"
    master.vm.hostname = "master"
    master.vm.provider "virtualbox" do |vb|
      vb.name = "Vagrant-Master"
      vb.memory = 2048
      vb.cpus = 2
    end
    config.vm.provision "shell", path: "scripts/master.sh"
  end

  num_nodes = 1
  ip_address = 121

  num_nodes.times do |i|
    node_name = "node-%02d" % (i + 1)
    node_ip = "192.168.10.#{ip_address}"
    
    config.vm.define node_name do |node|
      node.vm.box = "bento/ubuntu-22.04"
      node.vm.network "private_network", type: "static", ip: node_ip
      node.vm.hostname = node_name
      node.vm.provider "virtualbox" do |vb|
        vb.name = "Vagrant-#{node_name}"
        vb.memory = 2048
        vb.cpus = 2
      end
      config.vm.provision "shell", path: "scripts/node.sh"
    end

    ip_address += 1
  end
end
