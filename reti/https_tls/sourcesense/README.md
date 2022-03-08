# TLS

## Task Eseguiti

- Creata una vm con Vagrant da usare come CA
- Eliminato configurazione Vagrant e ansible per la creazione della coppia certificato/chiave
- Creata CA localmente con certificati salvati in ~/.ca 
- Importata la CA sulla mia mia macchina mac locale usando il comando security add-trusted-cert
- Creato uno script per la certificazione dei domini (scripts/cnd.sh)
- Modificato lo script cnd per restituire il certificato in formato pem
- Installato Flask e creato un endpoint che restituisce la solita pagina html
- Creato un Dockerfile dove esguire l'ambiente di sviluppo
- Creato Vagrantfile per tirare su una vm dove inserire l'applicativo
- Creato un playbook ansible per installare docker e eseguire l'applicativo al suo interno
- Modificato dockerfile per rendere effettivo il rilascio del servizio flask con ansible e docker
- Aggiunto haproxy nei task di ansible e creato prima forma di configurazione per haproxy
- Creato nuovo backend flask per poter testare il funzionamento di haproxy su due endpoint
- Creata nuova vm per procedere con il deploy di una pagina certificata dalla ca locale
- Aggiunto nel playbook task per esporre in https con un certificato generato da una ca locale
- Testato il comportamento delle funzionalità associate a openssl
- Usato il comando connect per verificare i certificati esposti dai web server creati

## Obiettivi

### Creazione certificati self-signed    

- [x] Creare una propria certification authority da importare eventualmente sulla workstation di lavoro o sul sistema operativo di un nodo di laboratorio 
- [x] Creare una propria certification authority da importare eventualmente sulla workstation di lavoro o sul sistema operativo di un nodo di laboratorio 
- [x] Creare una propria certification authority da importare eventualmente sulla workstation di lavoro o sul sistema operativo di un nodo di laboratorio 
- [x] Creare CSR
- [x] Generare dal CSR dei certificati x509 in formato PEM. Per quanto riguarda il dominio scegliere in autonomia (esempio: \*.foo.local)

### SSL Termination - Haproxy

- [x] Scrivere una semplice applicazione Flask (Python) che esponga un endpoint "Hello World" (preferibilmente utilizzare Docker)
- [x] Installare HaProxy
- [/] Esporre l'applicazione tramite HaProxy in https utilizzando i certificati creati nei punti precedenti.

### SSL Termination - Apache 
- [x] Esporre nella index.html la stringa "hello world"
- [x] Installare i certificati creati nei punti precedenti per erogare il sito.

### Openssl - Comandi Utili 
- [x] Comprendere i vari comandi di che verifica del contenuto di un certificato o conversione tra formati => [common openssl commands](https://www.sslshopper.com/article-most-common-openssl-commands.html)
- [x] Utilizzare "openssl s_client -connect" per verificare i certificati esposti dai web server creati nei punti precedenti
