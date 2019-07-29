Vagrant.require_version ">= 2.0.0"

Vagrant.configure(1) do |config|
    config.vm.box = "debian/buster64"

    config.vm.provision "shell", inline: <<-end
        sudo su
            apt  install python3-pip --yes
            pip3 install ansible
        exit
    end

    config.vm.provision "ansible_local" do |ansible|
        ansible.verbose = "v"
        ansible.limit = "local"
        ansible.playbook = "install.yaml"
        ansible.inventory_path = "inventory"
    end
end