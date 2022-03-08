# Ansible

## Task eseguiti

- Creato Vagrantfile con centos7
- Aggiunto playbook.yml ansible => provisioning/playbook.yml
- Una volta eseguito il setup del virt. env. python ho installato ansible
- Modificato il Vagrantfile per creare due vm
- testato il provisioning delle vm
- Creato variabili con valori diversi per ogni host creato
- Aggiunti gruppi di test nelle 2 vm
- Aggiunta una terza macchina e creato inventory ansible nel Vagrantfile
- Creato inventory sia in formato ini sia in formato yaml rispecchiando l'inventory definito nel Vagrantfile
- Aggiunto webserver ad una delle vm in modo che pubblichi una pagina helloworld
- Risolto problema di non forwarding della porta con stop del firewall e disabilitando enforce
- Aggiunta la risoluzione del problema del forewording con 2 task e un modulo installato dalla galaxy
- Suddiviso gli hosts in directory
- Creato modo per collegarsi tramite ssh anche senza l'uso di vagrant
- Eseguito playbook ansible con il comando di ansible-playbook
- Aggiunti elementi per il setup del certificato e chiave per rendere sicuro il sito in https 
- Creato un file criptato con ansible-vault
- Creato un play sui 2 hosts del gruppo 2 per installare git e clonare questa repository
- Variabili per la connessione alle macchine create da vagrant protette con ansible-vault (pass: test)
- Aggiunto script per prendere l'ip privato delle macchine del gruppo 2
- Aggiornata la sezione per il clone del progetto per fare in modo che solo nel caso di host3 venga eseguito il clone del progetto
- Creati roles con i task per: stoppare firewall, rendere selinux permissivo e installare web server apache
- Aggiornato playbook tls_test con l'uso dei roles e dei loops
- Creato un roles per testare il comportamente dei templates Jinja
- Il roles chiamato testjinja modifica il .bashrc di ogni macchina con configurazioni diverse sulla base delle vars imposte
- Creato un nuovo roles chiamato printHostsGroup che stampa la lista di hosts di un gruppo specifico
- Nel roles testjinja inserito un check sulla variabile var1 e nel caso in cui non sia stata definita viene restituito un errore
- Creato un task che nel caso in cui il giorno della macchina è pari restituisca un errore


## Obiettivi

### Ambiente

- [x] VMs create tramite Vagrant e l'apposito provisioner per Ansible (preferred)
- [/] Installare manualmente due o più VMs CentOS visibili tramite SSH

### Inventory

- [x] Creare un inventory Ansible che abbia due o più host (dipende dalla capacità di calcolo di disponibile) divisi in diversi gruppi
- [x] Assegnare variabili differenti (o le stesse con differenti valori) a seconda del gruppo di appartenenza
- [x] Scrivere l'inventory sia in formato ini che yaml
- [x] Scrivere un inventory yaml composto da un file per ogni gruppo di macchine posizionandoli nella directory inventory

### Playbooks

- [x] Creare un playbook che installi apache e pubblichi una pagina helloworld
- [x] Creare un playbook che utilizzi dati sensibili (passwords, keys, ecc.) e che li prenda da file criptati con ansible-vault
- [x] Inserire nel playbook dei check per cui determinati tasks vengano eseguiti solo al verificarsi di determinate condizioni (esistenza di file, servizi running, ...)
- [x] Ciclare un task in modo che venga ripetuto per tutti i valori di un array
- [x] Importare i tasks e le variabili da file esterni al playbook

### Templates

- [x] Deployare un template jinja in modo che il file risultante cambi a seconda della macchina su cui viene scritto
- [x] Deployare un template jinja che copi sulla macchina di destinazione un file contenente l'elenco delle macchine appartenenti ad un determinato gruppo dell'inventory

### Gestione errori

- [x] Inserire nel playbook dei check che verificano che determinate variabili siano definite
- [x] Configurare un task in modo da non interrompere l'esecuzione del playbook se il risultato è "fail"
- [x] Creare una propria certification authority da importare eventualmente sulla workstation di lavoro o sul sistema operativo di un nodo di laboratorio 
- [x] Creare una propria certification authority da importare eventualmente sulla workstation di lavoro o sul sistema operativo di un nodo di laboratorio 
- [x] Configurare un task che lancia un comando shell e che vada in errore se il comando restituisce un determinato output
