# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
VAGRANTFILE_API_VERSION = "2"

system("
    if [[ #{ARGV[0]} = 'up' ]]
    then
        echo 'Running setup.sh..'
        ./setup.sh
    fi
")

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    ssh_pub_key = File.readlines("./keys/id_rsa.pub").first.strip
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.hostmanager.enabled = true

    config.vm.define "swarm-nfs" do |srv|
        srv.vm.box = "bento/centos-7.4"
        srv.vm.network "private_network", ip: "192.168.2.20"
        srv.vm.hostname = "swarm-nfs"
        
        srv.vm.provider :virtualbox do |vb|
            vb.name = "swarm-nfs"
            vb.memory = "512"
            vb.gui = false
        end
        
        srv.vm.provision "shell", inline: <<-SHELL
            sudo echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            sudo grep -v '^127.0.0.1' /etc/hosts > /tmp/hosts
            sudo echo "127.0.0.1   localhost localhost.localdomain" >> /tmp/hosts
            sudo mv /tmp/hosts /etc/host
            sudo chmod 644 /etc/hosts
        SHELL
    end

    config.vm.define "swarm-master" do |srv|
        srv.vm.box = "bento/centos-7.4"
        srv.vm.network "private_network", ip: "192.168.2.21"
        srv.vm.hostname = "swarm-master"

        srv.vm.provider :virtualbox do |vb|
            vb.name = "swarm-master"
            vb.memory = "1024"
            vb.gui = false
        end

        srv.vm.provision "shell", inline: <<-SHELL
            sudo echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            sudo grep -v '^127.0.0.1' /etc/hosts > /tmp/hosts
            sudo echo "127.0.0.1   localhost localhost.localdomain" >> /tmp/hosts
            sudo mv /tmp/hosts /etc/host
            sudo chmod 644 /etc/hosts
        SHELL
    end

    config.vm.define "swarm-node1" do |srv|
        srv.vm.box = "bento/centos-7.4"
        srv.vm.network "private_network", ip: "192.168.2.22"
        srv.vm.hostname = "swarm-node1"

        srv.vm.provider :virtualbox do |vb|
            vb.name = "swarm-node1"
            vb.memory = "1024"
            vb.gui = false
        end

        srv.vm.provision "shell", inline: <<-SHELL
            sudo echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            sudo grep -v '^127.0.0.1' /etc/hosts > /tmp/hosts
            sudo echo "127.0.0.1   localhost localhost.localdomain" >> /tmp/hosts
            sudo mv /tmp/hosts /etc/host
            sudo chmod 644 /etc/hosts
        SHELL
    end
end
