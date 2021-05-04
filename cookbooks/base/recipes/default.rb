apt_package %w(zsh vim tmux mc htop) do
  action :install
end

# Shell configuration for vagrant user
git 'dotfiles' do
  action            :sync
  repository        'https://github.com/archydragon/dotfiles'
  revision          'master'
  destination       '/home/vagrant/.dotfiles'
  enable_submodules false
  user              'vagrant'
  group             'vagrant'
end

bash 'install_dotfiles' do
  action :run
  cwd    '/home/vagrant'
  user   'vagrant'
  group  'vagrant'
  environment ({'HOME' => '/home/vagrant', 'USER' => 'vagrant'})
  code <<-EOH
    ./.dotfiles/sh/initdot.sh
    EOH
end

# It is a copy of existing command in initdot.sh which fails to execute because of
# interactive password requirement
bash "vagrant_zsh" do
  code <<-EOT
    chsh -s /bin/zsh vagrant
  EOT
end
