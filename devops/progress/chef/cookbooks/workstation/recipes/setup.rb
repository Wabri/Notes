%w(
  tree
  git
  vim
).each do |package|
  package package.to_s do
    action :install
  end
end

template '/etc/motd' do
  source 'motd.erb'
  variables(
    name: ENV['LOGNAME']
  )
  action :create
end

execute 'create test file' do
  user 'vagrant'
  command 'touch /home/vagrant/test'
  not_if do
    ::File.exist?('/home/vagrant/test')
  end
end

cookbook_file '/home/vagrant/.bashrc' do
  source '.bashrc'
  owner 'vagrant'
  action :create
end

bash 'put vim to bashrc' do
  user 'vagrant'
  code <<~EOH
    echo "set -o vi" >> /home/vagrant/.bashrc
  EOH
  only_if do
    ::File.exist?('/home/vagrant/.bashrc')
  end
end

execute 'delete test file' do
  user 'vagrant'
  command 'rm /home/vagrant/test'
  only_if do
    ::File.exist?('/home/vagrant/test')
  end
end
