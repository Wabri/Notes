# Nomad

## Index

- [Cosa è](#Cosa-è)
- [Funzionalità chiave](#Funzionalità-chiave)
- [Core use cases](#Core-use-cases)
- [Installazione](#Installazione)
- [Vocabolario](#Vocabolario)
- [Resources](#Resources)

## Cosa è

È un workload orchestrator che abilita le organizzazioni di eseguire deploy semplicemente e gestire ogni tipo di applicazione usando un singolo e unificato workflow. È possibile eseguire diversi workload di applicazioni docker, non contenerizzate, microservizi o batch.

Nomad abilita gli sviluppatori a usare infrastructure-as-code per il deploy delle applicazioni. Nomad utilizza i pacchetti binary per efficentare la schedulazione dei jobs e ottimizzare l'utilizzo per le risorse.

## Funzionalità chiave

- Deploy Containers e Applicazioni legacy: la flessibilità di nomad come orchestratore abilita un'organizzazione a eseguire containers, legacy e applicazioni batch insieme nella stessa infrastruttura.
- Simple & Reliable: esegue come se fosse un singolo binario ed in completa autonomia, combinando la gestione delle risorse e la programmazione in un unico sistema. Non richiede un servizio esterno per lo storage o la coordinazione. Automaticamente gestisce i fallimenti lato applicativo, nei nodi o nei drivers. Nomad è distribuito e resiliente, usando metodi di leader election e state replication per rendere l'infrastruttura ad alta disponibilità in caso di fallimenti.
- Device Plugins & GPU Support: fa anche cose per il machine learning.
- Federation for Multi-region: supporta nativamente il multi-region federation. Questa capacità built-in permette di avere clusters multipli collegati insieme, consentendo di abilitare gli sviluppatori di eseguire deploy di jobs in ogni cluster di ogni regione. Federation abilita anche la replica di policies, risorse e altro su tutti i cluster.
- Proven Scalability: Nomad è ottimisticamente concorrente e questo aumenta i tempi di risposta e riduce la latenza sugli workloads.
- HashiCorp Ecosystem: risultano facili le integrazioni con terraform, consul, vault, service discovery e gestione dei segreti.

## Core use cases

### Docker container orchestration

Le organizzazione si stanno muovendo sempre di più verso uno workflow incentrato su Docker per il rilascio di applicazioni e la gestione di esse. Questa transizione richiede nuovi strumenti per automatizzare il piazzamente, esecuzione di job di aggiornamenti, abilita il self-service per gli sviluppatori e gestisce i fallimenti in modo automatico. Supporta un first-class Docker workflow e lo integra senza problemi con Consul e Vault per abilitare una soluzione completa mentre massimizza la flessibilità delle operazioni. Nomad è semplice da usare, può scalare su migliaia i nodi in un singolo cluster e può rilasciare facilmente attraverso data center privati e molteplici cloud.

### Legacy application deployment

Un'applicazione che si basa su una macchina virtuale per la strategia di deploy può portare ad abbassare la frequenza di uso dell'hardware e aumentare i costi dell'infrastruttura. Mentre usando una strategia Docker-based può risultare non pratica per alcune organizzazioni o alcuni casi, il potenziale per migliorare l'automazione, aumentare la resilienza e ridurre i costi è molto attrattiva. Nomad supporta nativamente l'esecuzione di applicazioni legacy, binari statici, Java JAR, QEMU virtual machines e semplici comandi OS. Gli workloads sono nativamente isolati a runtime e i binari sono impacchettati per massimizzare l'efficienza e l'utilizzo riducendone il costo. Gli sviluppatori e gli operatori hanno anche il vantaggio di usare le automazioni API-driven e aumentare l'affidabilità delle applicazioni attraverso la gestione automatica degli errori.

### Microservices

I microservizi e le architetture orientate ai servizi sono un paradigma di progettazione pensato per quei servizi con uno scopo ben preciso, uno stato di incapsulazione stretto e una comunicazione orientata dalle API che interagiscono per formare una soluzione più grande. Nonostante questo, gestire centinaia o migliaia di servizi al posto di una enorme applicazione crea delle sfide di tipo operativo. Tramite questo strumento è possibile poter fare un'integrazione molto elegantemente con Consul per la registrazione automatica del servizio e renderizzare maniera dinamica la configurazione dei files. Questa combo Nomad+Consul provvede a una soluzione ideale per la gestione dei microservizi, creando un paradigma di adozione molto semplice.

### Batch processing workloads

I teams di data science e analytics crescono in numero e complessità di conseguenza aumenteranno i benefit dagli strumenti ad alta performance e scalabilità che eseguono workloads di tipo batch con un un tempo di overhead minimo. Nativamente Nomad può eseguire tutti i job batch e job parametrizzati. L'architettura Nomad abilita una scalabilità semplice e una strategia di scheduling ottimisticamente concorrente che provvede a gestire migliaia conteiner rilasciati ogni secondo. Le alternative sono molto più complesse e limitate in termini di tempi di risposta di scheduling, scalabilità e capacità multi-cloud.

### Multi-region and multi-cloud federated deployments

Nomad è nativamente costruito per gestire rilasci multi-datacenter e multi-region inoltre è cloud agnostic. Questo permette a Nomad di schedulare in qualsiasi tipo di datacenters che viene eseguito su metallo, OpenStack oppure su VMware in cloud di tipo AWS, Azure o GCE. Questo rende semplice migrare gli workloads in maniera incrementale e usare il cloud per il bursting.

## Installazione

Nomad è uno strumento di orchestrazione che consente di rilasciare e gestire le applicazioni. È flessibile e può eseguire sia workloads containerized o anche non containerized.

### Installazione locale

Seguire le indicazioni [qui](https://www.nomadproject.io/downloads).

### Usare Vagrant

È possibile usare vagrant per mettere in piedi un environment per Nomad.

Creare una directory di un generico progetto e scaricare il Vagrantfile reso disponibile da HashiCorp:

```Bash
curl -O https://raw.githubusercontent.com/hashicorp/nomad/master/demo/vagrant/Vagrantfile

```

Eseguire la creazione della macchina:

```Bash
vagrant up
```

Una volta che vagrant completa è possibile eseguire ssh dentro la vm:

```Bash
vagrant ssh
```

## Resources

- (Deploy Your First App with HashiCorp Nomad in 20 mins)[https://www.youtube.com/watch?v=SSfuhOLfJUg]
- (get_started)[https://learn.hashicorp.com/collections/nomad/get-started]
