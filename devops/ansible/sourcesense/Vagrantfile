Vagrant.configure("2") do |config|

  config.vm.box = "generic/centos8"

  config.ssh.forward_agent = true
  config.vm.provision :shell, path: "provisioning/passauthyes.sh"

  config.vm.define "gitlab_server" do |glserver|
    glserver.vm.network :private_network, ip: "192.168.59.103"
    glserver.vm.provider :virtualbox do |vm|
      vm.customize ["modifyvm", :id, "--memory", 4096]
      vm.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

  config.vm.define "jenkins_server" do |jkserver|
    jkserver.vm.network :private_network, ip: "192.168.59.104"
    jkserver.vm.provider :virtualbox do |vm|
      vm.customize ["modifyvm", :id, "--memory", 1024]
      vm.customize ["modifyvm", :id, "--cpus", 2]
    end
  end

  config.vm.provision "ansible" do |ansible|    
    ansible.playbook = "ansible/playbooks/gitlab.yml"
  end

end
