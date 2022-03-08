image_source = 'https://avatars.githubusercontent.com/u/12409541'
image_path = '/var/www/html/user.png'

package 'httpd' do
  action :install
end

user 'apache' do
  comment 'apache'
  uid '123'
  home '/u01'
  shell '/bin/bash'
end

group 'www-admins' do
  members ['apache']
end

directory '/var/www/html' do
  owner 'apache'
  group 'www-admins'
  recursive true
end

remote_file image_path do
  source image_source
  owner 'apache'
  group 'www-admins'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    name: ENV['LOGNAME'],
    image: File.basename(image_path)
  )
  owner 'apache'
  group 'www-admins'
  action :create
  notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
  action [ :enable, :start ]
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
