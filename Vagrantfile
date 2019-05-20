VAGRANTFILE_API_VERSION = "2"
OS_IMAGE_VERSION = "bento/ubuntu-18.04"  # Required version Bionic 18.04 (LTS) to run docker.

VM_SETTING = {"loadbalancer" => "192.168.56.3", "app1" => "192.168.56.4", "app2" => "192.168.56.5"}
# The "2" in the first line above represents the version of the configuration object config that will be used for configuration for that block (the section between the do and the end). This object can be very different from version to version.
# Currently, there are only two supported versions: "1" and "2". Version 1 represents the configuration from Vagrant 1.0.x. "2" represents the configuration for 1.1+ leading up to 2.0.x.
# Configure the [base box] to be ubuntu v18.04 from Bento library (downloaded from remote).
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = OS_IMAGE_VERSION
  
	VM_SETTING.each do |vm_name, static_ip|
		config.vm.define vm_name do |instance|
			# Setup a static IP which will be used for the VM.
			instance.vm.network "private_network", ip: static_ip
			# Setup the unique hostname for the VM.
			instance.vm.hostname = "#{vm_name}-local"
			# Install basic tools/commands and its dependencies by Shell provisioning.
			instance.vm.provision :shell, path: "./script/install_basic.sh"
		end
	end
	
	config.vm.define :loadbalancer do |instance|
		instance.vm.synced_folder "../vagrant_syn_content/docker-nignx", "/vagrant_syn_content/docker-nignx"
	
		# Install docker and its dependencies by Shell provisioning.
		# We can test our provision changes by vagrant provision command. Otherwise, only the initial vagrant up will run provision.
		instance.vm.provision :shell, path: "./script/install_docker.sh"
	end
	
	config.vm.define :app1 do |instance|
		instance.vm.provision :shell, path: "./script/testonly.sh"
	end
end