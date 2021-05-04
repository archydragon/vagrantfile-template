Settings = {
  "memory" => 4096,
  "cpus"   => 2,
}

Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2004"

  # provider specific configs
  config.vm.provider "parallels" do |prl|
    prl.customize ["set", :id,
                   "--cpus", Settings["cpus"],
                   "--memsize", Settings["memory"]]
    prl.check_guest_tools = true
    prl.update_guest_tools = true
  end

  config.vm.define :devbox do |cfg|
    cfg.vm.hostname = "devbox"
  end

  config.vm.provision "chef_solo" do |chef|
    chef.version = "16.13"
    chef.arguments = "--chef-license accept"
    chef.add_recipe "base"
  end

end
