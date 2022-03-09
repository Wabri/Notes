# Vagrant Snippets

## Init

Inizializzare vm con inizializzazione file Vagrantfile

```bash
vagrant init hashicorp/bionic64
```

## Box

Creare un box di una vm evitando la creazione del Vagrantfile

```bash
vagrant box add hashicorp/bionic64
```

Lista dei box attivi

```bash
vagrant box list
```

Rimuovere un box

```bash
vagrant box remove hashicorp/bionic64
```

## Up

Eseguire vm

```bash
vagrant up
```

## Destroy

Distruggere vm

```bash
vagrant destroy
```

## Ssh

Ssh nella macchina creata

```bash
vagrant ssh
```

Oppure tramite ssh classico

```bash
ssh vagrant@localhost -p 2222 -i .vagrant/machines/host1/virtualbox/private_key
```

## Suspend/Halt

Sospendere una vm significa salvare il suo stato attuale questo implica che il suo stato viene salvato implicando quindi il salvataggio delle risorse RAM che erano utilizzate in quel momento.

```bash
vagrant suspend
```

Fermare una vm significa spegnerla, per motivi ovvi quando dovrà essere riusata impiegherà più tempo rispetto a una vm sospesa.

```bash
vagrant halt
```

## Provision

Possamo indicare alla macchina di eseguire uno script quando viene eseguito il primo setup. Nel Vagrantfile:

```ruby
Vagrant.configure("2") do |config|
	config.vm.box = "hashicorp/bionic64"
	config.vm.provision :shell, path: "bootstrap.sh"
end
```

Nell'esempio lo script di bootstrap è questo:

```bash
#!/usr/bin/env bash

apt-get update
apt-get install -y apache2
if ! [ -L /var/www ]; then
	rm -rf /var/www
	ln -fs /vagrant /var/www
fi
```

Se la vm è già running allora è necessario indicare di ricaricare il provision:

```bash
vagrant reload --provision
```

## Network

Nella configurazione di vagrant possiamo indicare la porta dell'host a cui deve essere reindirizzata la porta di forward usata dalla vm

```ruby
Vagrant.configure("2") do |config|
	...	
	config.vm.network :forwarded_port, guest: 80, :host 4567
	...
end
```

In questo caso è necessario eseguire il reload della vm:

```bash
vagrant reload
```

## Installare plugins

Se sono necessarie delle funzionalità maggiori allora è possibile installare dei plugin

```bash
vagrant plugin install <nome_plugin>
```
