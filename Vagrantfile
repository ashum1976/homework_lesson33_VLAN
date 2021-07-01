# -*- mode: ruby -*-
# vim: set ft=ruby :
# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
:inetRouter => {
        :box_name => "centos/7",
        :net => [
                   {ip: '', adapter: 2, virtualbox__intnet: "router-net"},
                   {ip: '', adapter: 3, virtualbox__intnet: "test-net"},
                   {ip: '', adapter: 4, virtualbox__intnet: "router-net"},
                ]
  },

:centralRouter => {
        :box_name => "centos/7",
        :net => [
                   {ip: '', adapter: 2, virtualbox__intnet: "router-net"},
                   {ip: '', adapter: 3, virtualbox__intnet: "test-net"},
                   {ip: '', adapter: 4, virtualbox__intnet: "router-net"},
                   {ip: '192.168.3.3', adapter: 5, netmask: "255.255.255.240", virtualbox__intnet: "office1-router"},
                ]
  },

:office1Router =>
                  {
        :box_name => "centos/7",
        :net => [
                   {ip: '192.168.3.4', adapter: 2, netmask: "255.255.255.240", virtualbox__intnet: "office1-router"},
                   {ip: '192.168.4.2', adapter: 3, netmask: "255.255.255.192", virtualbox__intnet: "test-net"},

                  ]
                },
:testServer1 => {
          :box_name => "centos/7",
          :net => [
                  {ip: '192.168.4.4', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "test-net"},
                  # {ip: "", adapter: 2, virtualbox__intnet: "test-vnet"},
                  ]
                },
:testServer2 => {
          :box_name => "centos/7",
          :net => [
                  {ip: '192.168.4.5', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "test-net"},
                  # {ip: "", adapter: 2,  virtualbox__intnet: "test-vnet"},
                  ]
                },
:testClient1 => {
          :box_name => "centos/7",
          :net => [
                  {ip: '192.168.4.6', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "test-net"},
                  # {ip: "", adapter: 2, virtualbox__intnet: "test-vnet"},
                  ]
                },
:testClient2 => {
          :box_name => "centos/7",
          :net => [
                  {ip: '192.168.4.7', adapter: 2, netmask: "255.255.255.192", virtualbox__intnet: "test-net"},
                  # {ip: "", adapter: 2, virtualbox__intnet: "test-vnet"},
                  ]
                },

}

Vagrant.configure("2") do |config|

    config.vm.provider "virtualbox" do |v|
        v.memory = 512
        v.cpus = 1
          end

  MACHINES.each do |boxname, boxconfig|
    config.vm.synced_folder "./", "/vagrant", type: "rsync", rsync__auto: true, rsync__exclude: ['./hddvm, README.md']
    config.vm.define boxname do |box|

        box.vm.box = boxconfig[:box_name]
        box.vm.host_name = boxname.to_s

        boxconfig[:net].each do |ipconf|
          box.vm.network "private_network", ipconf
        end

        box.vm.provision "shell", inline: <<-SHELL
          mkdir -p ~root/.ssh
          cp ~vagrant/.ssh/auth* ~root/.ssh
          sed -i.bak 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
          systemctl restart sshd

        SHELL

        box.vm.provision :ansible_local do |ansible|
          #Установка  коллекции community.general, для использования community.general.nmcli (nmcli) управление сетевыми устройствами.
          # ansible.galaxy_command = 'ansible-galaxy collection install community.general'
          ansible.verbose = "vv"
          ansible.install = "true"
          #ansible.limit = "all"
          ansible.tags = boxname.to_s
          # ansible.tags = "facts"
          ansible.inventory_path = "./ansible/inventory/"
          ansible.playbook = "./ansible/playbooks/vlan.yml"
          end

      end

  end


end
