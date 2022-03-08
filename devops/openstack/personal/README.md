# Openstack

## Introduzione

Il sistema consiste in svariati servizi chiave che sono installati separatamente. Questi servizi lavorano insieme dipendentemente dal cloud su cui stiamo lavorando e inoltre se inculde:

- Compute
- Identity
- Networking
- Image
- Block Storage
- Object Storage
- Telemetry
- Orchestration
- Database

Tutti questi servizi possono essere installati separatamente e configurati come se fossero elementi stand-alone oppure come se fossero collegati tutti insieme.

## Sistemi operativi

Questo strumento è possibile installarlo in svariati sistemi operativi:

- OpenSuse
- RHEL
- Centos
- Ubuntu

## Get started

OpenStack è un progetto open source di cloud computing per tutti i tipi di clouds che ha come obiettivo quello di essere semplice da implementare, essere il più scalabile possibile e pieno di features.

OpenStack è una soluzione IaaS (Infrastructure as a Service) attraverso un set di servizi correlati tra loro. Ogni servizio offre una API (ApplicationProgramming Interface) che facilita questa integrazione. Sulla base delle necessità è possibile installare alcuni di questi o tutti.

L'OpenStack project navigator permette di navigare i servizi che formano l'architettura di questo strumento filtrando per categorie, tipo e numero di release facilitandone la ricerca.

Sotto abbiamo un diagramma che spiega come i servizi siano collegati tra di loro:

![Screenshot 2021-08-30 at 09.50.54.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f82b6d70-6af2-4cfa-bb34-0280dd89398d/Screenshot_2021-08-30_at_09.50.54.png)

Per progettare, rilasciare e configurare OpenStack, gli amministratori devono capirne la logica della sua architettura.

Come viene fatto vedere nell'immagine sopra l'architettura di questo strumento consiste in diverse parti indipendenti chiamate OpenStack services. Tutti i servizi sono autenticati con una Identity service comune. I servizi interagiscono individualmente tra di loro attraverso le API pubbliche, ma non possono per motivi ovvi usare comandi dove i comandi necessitano di privilegi da amministratore.

Internamente i servizi di OpenStack sono composti da diversi processi. Tutti i servizi hanno almeno un processo dedicato alle API che rimane in ascolto di richieste, quando arrivano le preprocessa e infine le passa alle parti del servizio che viene chiamato. Fatta eccezione del servizio Identity che lavora in diverso modo.

Per la comunicazione tra i processi di un singolo servizio viene usato un AMQP message broker. Per salvare lo stato dei servizi viene usato un database, che quando Openstack viene rilasciato in un cloud è possibile scegliere tra diversi DB come: RabbitMQ, MySQL, MariaDB, SQLite.

Gli utenti possono accedere a OpenStack tramite interfaccia web implementata dalla dashboard Horizon, oppure tramite cli o usando richieste tramite le API messe a disposizione dai servizi. Per le applicazioni sono disponibili diversi SDKs. Tutti questi metodi utilizzando chiamate al REST API dei vari servizi OpenStack.

## Panoramica

OpenStack è una piattaforma di cloud computing open source che supporta tutte le tipologie di ambienti cloud. Il progetto ha come obiettivo: la semplicità di implementazione, la scalabilità massiva e un set di funzionalità molto ricco.

Una volta preso confidenza con questo strumento possiamo procedere con:

- Determinare e implmentare i servizi necessari e opzionali per rendere performante l'architettura che vogliamo instaurare.
- Incrementare la sicurezza usando metodi come firewalls, criptografia e service policies.
- Usare uno strumento di deployment come Ansible, Chef, Puppet, Salt per automatizzare e gestire l'ambiente di produzione.

## Architettura di esempio

L'architettura che vedremo richiede come minimo due nodi, chiamati hosts, per poter eseguire una basilare virtual machine o un'istanza. L'esempio non deve essere inteso per un utilizzo in produzione perchè è una versione molto minimale e insicura in termini di gestione della rete.

Utilizzeremo 2 blocchi necessari e 2 opzionalil:

- Controller
- Compute
- Block Storage (opzionale)
- Object Storage (opzionale)

Il nodo Controller esegue i servizi:

- Identity
- Image
- Placement
- Portions of Compute
- Portion of Networking
- Various Networkign agents
- Dashboard

Per gestire tutti questi servizi ha bisogno di altre dipendenze come SQL database, message queue, NTP. Opzionalmente questo nodo può eseguire anche porzioni di Block Strage, Object Storage, Orchestration e Telementry. Per funzionare inoltre ha necessità di avere almeno 2 interfacce di network.

Il nodo Compute esegue la porzione che fa da hypervisor per la computazione di istanze. Di default, il nodo usa KVM come backend di hypervisoring. In più esegue un agent service per il Networking che connette le istanze al network virtuale con un servizio di firewall per istanziare la security groups.

Per rendere la nostra architettura più efficiente possiamo aggiungere più di un node per il computing. Ogni nodo ovviamente ha bisogno di un minmo di 2 interfacce per il network.

Il nodo Block Storage contiene il disco di storage che il Block Storage e lo Shared File System mettono a disposizione per le istanze.

Se necessario più storage possiamo aggiungere altri nodi di questo tipo tenendo a mente che è necessaria una sola interfaccia network.

Infine il nodo Object Storage contiene lo storage che i servizi usano per memorizzare accounts, containers e oggetti. Per questa funzionalità sono necessari almeno 2 nodi con un minimo di 1 interfaccia di rete, possiamo estendere se necessario il numero di nodi di questo tipo.

![Screenshot 2021-08-30 at 12.39.55.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e8eb6ea4-31dd-403b-9d11-dc0e5d218fc2/Screenshot_2021-08-30_at_12.39.55.png)

## Networking

Ci sono due diversi tipi di Network che possono essere usati:

- Provider networks
- Self-service networks

Il primo è quello più semplice che può essere usato, essenzialmente crea un bridge tra la vm e la rete fisica affidandosi all'infrastruttura della rete fisica, in più un servizio DHCP provvede alla selezione di un IP.

La seconda scelta agisce sul network utilizzando un servizio di routing che abilita il self-service networks usando un metodo specifico chiamato CXLAN. Praticamente utilizza NAT per creare delle routes tra la macchina virtuale e il network fisico.

## Ambiente

Usando l'architettura di esempio sopra esposta spieghiamo come configurare il nodo Controller e un nodo Compute.

Anche se molti environment includono molti servizi, lo Object Storage service può operare in maniera indipendente.

Per modificare le configurazioni di ogni nodo sono necessari i privilgie da amministratore perchè sarà fondamentale eseguire comandi come un root user oppure essere tra i sudoers nel nodo.

Per avere le migliori performance è consigliato che il nostro environmente pareggi o superi i requisiti minimi:

- Controller Node: 1 processor, 4GB di memoria e 5GB storage
- Compute Node: 1 processor, 2GB di memoria e 10GB storage

Ovviamente se i servizi e le virtual manchine aumentano di numero di conseguenza aumenteranno anche i requisiti minimi. Per questo viene consigliato di sostituire le risorse hardware nel caso in cui si notino dei cali sulle prestazioni dopo che è stato aggiunto un servizio o una vm.

Per questioni di facilità viene consigliato di usare una distribuzione a 64bit di Linux per ogni nodo usato.

Per le installazioni base può bastare l'uso di una singola partizione, tuttavia nel caso di un environment con più servizi, come Block Storage, viene consigliato un Logical Volume Manager (LVM).

ATTENZIONE: è pratica comune decidere di fare la build di ogni host su una virtual machine, ma questa scelta può ridurre le performance delle istanze soprattutto se l'hypervisor o il processore manca di un supporto di tipo hardware per la gestione di vm annidate.

## Sicurezza

I servizi di OpenStack supportano vari metodi di sicurezza come password, policy e crittografia. In più supporta servizi che includono server database e message broker support password security.

Per facilitare il processo di installazione è consigliato di creare una password sicura manualmente, ricordando che in alcune configurazioni caratteri speciali come @ non vengono accettati. Viene raccomandato quindi di usare un tool di generazione password come pwgen oppure openssl:

```bash
openssl rand -hex 10
```

Durante l'installazione OpenStack e i servizi di supporto richiederanno i privilegi amministrativi, in alcuni casi possono esserci dei servizi che interferiranno con strumenti di deployment automation come Ansible, Chef e Puppet. Ad esempio, servizi di OpenStack potrebbero aggiungere un wrapper root a sud che interferisce con le policies di sicurezza.

Il servizio di Netwrking assume di default valori per parametri relativi al kernel network e modifica le regole di firewall. Per evitare problemi durante l'installazione iniziale è raccomandato di usare una distribzione di stock supportata dalla macchina dove lavoriamo. Pertanto se scegliamo di automatizzare i rilasci sarà necessario revisionare la configurazione e le policies applicate ad essa prima di procedere.

(pagina 17 o 23, capitolo host networking)

[https://docs.openstack.org//install-guide/InstallGuide.pdf](https://docs.openstack.org//install-guide/InstallGuide.pdf)
