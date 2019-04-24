Vagrant.require_version ">= 2.0.0"

Vagrant.configure(1) do |config|
    config.vm.box = "debian/stretch64"
    config.vm.provision "shell", inline: "apt install --yes vim git python3-pip"
    config.vm.provision "ansible_local" do |ansible|
        ansible.verbose = "v"
        ansible.limit = "local"
        ansible.playbook = "install.yaml"
        ansible.inventory_path = "inventory"
    end
end
