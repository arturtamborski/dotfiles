Vagrant.require_version ">= 2.0.0"

$script = <<-EOF
sudo su
    apt install --yes vim python3
    python3 -m pip install ansible
exit
EOF

Vagrant.configure(1) do |config|
    config.vm.box = "debian/stretch64"

    # install latest version of ansible
    config.vm.provision "shell", inline: $script

    # provision box
    config.vm.provision "ansible_local" do |ansible|
        ansible.verbose = "v"
        ansible.limit = "local"
        ansible.playbook = "install.yaml"
        ansible.inventory_path = "inventory"
    end
end
