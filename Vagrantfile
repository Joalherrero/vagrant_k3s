Vagrant.configure('2') do |config|
  config.vm.define :k3s do |k3s_vm|
    k3s_vm.vm.box = 'centos/8'
    k3s_vm.vm.network "private_network", ip: "192.168.59.24"
    k3s_vm.vm.hostname = "k3s"
    k3s_vm.vm.hostname = 'k3s'
#    k3s_vm.vm.synced_folder 'vagrant_podman', '/vagrant_podman'
#    k3s_vm.vm.synced_folder "ansible_podman", "/vagrant_podman", :mount_options => ["ro"]
    k3s_vm.vm.provision "shell", inline: "echo 'nameserver 8.8.8.8' | sudo tee /etc/resolv.conf > /dev/null"
    k3s_vm.vm.provision 'shell', path: './scripts/k3s_machine.sh'

    k3s_vm.vm.provider :libvirt do |lv, override|
      #lv.memory = 2*1024
      #lv.cpus = 2
      #lv.cpu_mode = 'host-passthrough'

      lv.customize ["modifyvm", :id, "--memory", "2048"]
      lv.customize ["modifyvm", :id, "--cpus", "2"]
      lv.customize ["storagectl", :id, "--name", "IDE Controller", "--add", "ide"]
      lv.customize ["storageattach", :id, "--storagectl", "IDE Controller", "--port", "1", "--device", "0", "--type", "dvddrive", "--medium", "guestadditions.iso"]
    end

  end
end
