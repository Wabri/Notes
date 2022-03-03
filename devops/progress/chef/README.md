# Chef

## Index

- [Requisiti](#Requisiti)
- [Riprodurre ambiente](#Riprodurre-ambiente)
- [Creazione file](#Creazione-file)
- [Modifica della recipe con permessi owner e group](#Modifica-della-recipe-con-permessi-owner-e-group)
- [Creare un cookbook](#Creare-un-cookbook)
- [Creazione cookbook per rilascio web server](#Creazione-cookbook-per-rilascio-web-server)
- [Eseguire più recipe di cookbook differenti](#Eseguire-più-recipe-di-cookbook-differenti)
- [Includere recipe dentro altre recipe](#Includere-recipe-dentro-altre-recipe)
- [Node object](#Node-object)
- [Templates per rendere il codice pulito](#Templates-per-rendere-il-codice-pulito)
- [Files statici](#Files-statici)
- [File remoti](#File-remoti)
- [Eseguire script](#Eseguire-script)
- [Notificare altre risorse](#Notificare-altre-risorse)

## Requisiti

- virtualbox
- vagrant
- chefworkstation

## Riprodurre ambiente

### Creazione macchina

```
vagrant add box bento/centos-7 --provider=virtualbox

vagrant init bento/centos-7

vagrant up
```

### Installazione chef client

```
vagrant ssh

curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk

sudo chef-client --chef-license accept
```

## Creazione file

```
vagrant ssh

touch hello.rb

vim hello.rb
```

hello.rb:
```Ruby
file '/hello.txt' do
	content 'Hello world!'
end
```

```
sudo chef-client --local-mode hello.rb

cat /hello.txt
```

## Modifica della recipe con permessi owner e group

hello.rb:
```Ruby
file '/hello.txt' do
	content 'Hello world!'
	mode '0644'
	owner 'root'
	group 'root'
	action :create
end
```

```
sudo chown vagrant /hello.txt

ls -l /hello.txt

sudo chef-client --local-mode hello.rb

ls -l /hello.txt
```

### Installare pacchetti e ancora sui file

setup.rb
```Ruby
%w[
	tree
	ntp
].each do |package|
	package package.to_s do
		action :install
	end
end

file '/etc/motd' do
	content 'This server is the property of Wabri'
	owner 'root'
	group 'root'
end
```

```
sudo chef-client --local-mode setup.rb
```

## Creare un cookbook

```
mkdir cookbooks

chef generate cookbook cookbooks/workstation

mv setup.rb cookbooks/workstation/recipes/

cd cookbooks/worstation/

tree
```

## Creazione cookbook per rilascio web server

```
chef generate cookbook cookbooks/apache

cd cookbooks/apache

chef generate cookbook . server

vim recipes/server.rb
```

./cookbooks/apache/recipes/server.rb:
```Ruby
package 'httpd' do
	action :install
end

file '/var/www/html/index.html' do
	content '<h1>Hello world!</h1>'
end

service 'httpd' do
	action [ :enable, :start ]
end
```

```
sudo chef-client --local-mode recipes/setup.rb

curl localhost
```

## Eseguire più recipe di cookbook differenti

```
sudo chef-client -z --runlist "apache::server" 

sudo chef-client -z --runlist "recipe[apache::server]"

sudo chef-client -z --runlist "recipe[apache::server],recipe[workstation::setup]"
```

## Includere recipe dentro altre recipe

./cookbooks/apache/recipes/default.rb
```Ruby
include_recipe 'apache::server'
```

```
sudo chef-client -z -r "recipe[apache]"
```

## Node object

```
ohai

ohai ipaddress

ohai cpu/0/mhz

ohai memory/total
```

./cookbooks/apache/recipes/server.rb
```Ruby
package 'httpd' do
        action :install
end

file '/var/www/html/index.html' do
        content "<h1>Hello world!</h1>
                <div>HOSTNAME: #{node['hostname']}</div>
                <div>IPADDRESS: #{node['ipaddress']}</div>
                <div>CPU: #{node['cpu']['0']['mhz']}</div>
                <div>MEMORY: #{node['memory']['total']}</div>
        "
end

service 'httpd' do
        action [ :enable, :start ]
end
```

```
sudo chef-client -zr "recipe[apache]"
```

## Templates per rendere il codice pulito

```
chef generate template cookbooks/workstation motd
```

./cookbooks/workstation/templates/motd.erb
```Embedded Ruby
This server is the property of <%= @name %>
		HOSTNAME: <%= node['hostname'] %>
		IPADDRESS: <%= node['ipaddress'] %>
		CPU: <%= node['cpu']['0']['mhz'] %>
		MEMORY: <%= node['memory']['total'] %>
```

./cookbooks/workstation/recipes/setup.rb
```Ruby
template '/etc/motd' do
	source 'motd.erb'
	variables(
		:name => ENV['LOGNAME']
	)
	action :create
end
```

Fare lo stesso per il cookbook apache e eseguire il client

```
sudo chef-client -zr "recipe[workstation],recipe[workstation]"
```

## Files statici

```
chef generate file cookbooks/workstation .basrhc
```

./cookbooks/workstation/files/.basrhc
```Bash
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

export EDITOR=vim
export VISUAL=vim
export TERM="xterm-256color"
```

./cookbooks/workstation/recipes/setup.rb
```Ruby
cookbook_file '/home/vagrant/.bashrc' do
	source '.bashrc'
	action :create
end
```

```
sudo chef-client -zr "recipe[workstation]"
```

## File remoti

./cookbooks/apache/recipes/server.rb
```Ruby
image_source = 'https://avatars.githubusercontent.com/u/12409541'
image_path = '/var/www/html/user.png'

remote_file image_path do
  source image_source
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    :name => ENV['LOGNAME'],
    :image => File.basename(image_path) 
  )
  action :create
end
```

## Eseguire script

./cookbooks/workstation/recipes/setup.rb
```Ruby
bash 'put vim to bashrc' do
	user 'vagrant' 
	code 'echo "set -o vi" >> /home/vagrant/.bashrc'
	only_if '[ -f /home/vagrant/.bashrc ]'
end

bash 'put date to bashrc' do
	user 'vagrant'
	code <<~EOH # extended
		echo "date" >> /home/vagrant/.bashrc
	EOH
	only_if do # ruby version
		File.exist?('/home/vagrant/.bashrc')
	end
end

execute 'delete test file' do
	user 'vagrant'
	command 'rm /home/vagrant/test'
	only_if File.exist?('/home/vagrant/test')
end
```

## Notificare altre risorse

./cookbooks/apache/recipes/server.rb
```Ruby
template '/var/www/html/index.html' do
  [...]
  notifies :restart, 'service[httpd]', :immediately
end
```

Se la risorsa template applica una modifica allora verrà notificata la risorsa service[httpd] che eseguirà il restart.

Allo stesso modo è possibile usare subscribes, ma in questo caso applicarlo alla risorsa service:

```Ruby
service 'httpd' do
  ...
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
``` 

