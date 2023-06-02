Vagrant.configure('2') do |config|
  config.ssh.insert_key = false
  config.vm.provider "virtualbox" do |v|
      v.memory = 4048
      v.cpus = 2
  end
  
  config.vm.define :k3s do |k3s_master|
    k3s_master.vm.box = 'centos/8'
    k3s_master.vm.network "private_network", ip: "192.168.59.24"
    k3s_master.vm.network "forwarded_port", guest: 6443, host: 6443
    k3s_master.vm.network "forwarded_port", guest: 8080, host: 8080
    k3s_master.vm.hostname = "k3s-master"
    k3s_master.vm.hostname = 'k3s-master'
    k3s_master.vm.provision "shell", inline: "echo 'nameserver 8.8.8.8' | sudo tee /etc/resolv.conf > /dev/null"
    k3s_master.vm.provision 'shell', path: './scripts/k3s_machine.sh'
    end
  end

  # config.vm.define :k3s do |k3s_agent|
  #   k3s_agent.vm.box = 'centos/8'
  #   k3s_agent.vm.network "private_network", ip: "192.168.59.24"
  #   k3s_agent.vm.network "forwarded_port", guest: 6443, host: 6443
  #   k3s_agent.vm.hostname = "k3s-agent"
  #   k3s_agent.vm.hostname = 'k3s-agent'
  #   k3s_agent.vm.provision "shell", inline: "echo 'nameserver 8.8.8.8' | sudo tee /etc/resolv.conf > /dev/null"
  #   k3s_agent.vm.provision 'shell', path: './scripts/k3s_machine.sh'
  #   end
  # end
