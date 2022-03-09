# Esporre tramite un certificato self-signed Apache in HTTPS

> TLS = transport layer security
> SSL = secure sockets layer

Entrambi sono protocolli web usati per impacchettare il normale traffico in un protetto e criptato impacchettatore. SSL predecessore del TLS.

Usando questa tecnologia i server possono inviare informazioni sicure ai vari client che richiedono il traffico senza la possibilita' di essere intercettati da terzi.

TLS/SSL funzionano grazie a una combinazione di un certificato pubblico e una chiave privata.

La chiave SSL è mantenuta segreta nel server e viene usata per criptare il contenuto inviato dai clienti. Mentre il certificato è condiviso pubblicamente da chi lo richiede ed è usato per decriptare il contenuto firmato dalla chiave SSL associata.

Prima di tutto installiamo sia openssl sia mod_ssl che ci servirà per gestire il certificato e la chiave:

```bash
sudo yum install openssl mod_ssl
```

Creiamo le directory dove andremo a creare la coppia chiave/certificato:

```bash
sudo mkdir /etc/ssl/private
sudo mkdir /etc/ssl/certs
```

E infine creiamo la coppia chiave self-signed e certificato usando OpenSSL:

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
			-keyout /etc/ssl/private/apache.key \
			-out /etc/ssl/certs/apache.crt
```

- **req** è un sottocomando di openssl per specificare il cerficato con cui le richieste vengono gestite.
- **-x509** modifica la req indicando che quello che vogliamo creare è un certificato self-signed.
- **-nodes** impedisce che il certificato venga bloccato da una passphrase.
- **-days 365** è l'argomento che determina per quanto il certificato rimarrà valido.
- **-newkey rsa:2048** ci dice che vogliamo creare sia un certificato che una chiave allo stesso tempo.
- **-keyout** dove andiamo a posizionare la chiave privata.
- **-out** dove il certificato deve essere creato.

Verranno richiesti di inserire dei dati per completare il certificato, l'unico necessario da inserire è quello relativo all'hostname in cui andremo a indicare il sito.

Siccome stiamo usando openssl dobbiamo creare uno strong Diffie-Hellman group che verrà usato per negoziare la Perfect Forward Secrecy con i clients:

```bash
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
```

Che poi dobbiamo aggiungere in coda a certificato precedentemente creato:

```bash
cat /etc/ssl/certs/dhparam.pem | sudo tee -a /etc/ssl/certs/apache.crt
```

Dobbiamo ora modificare il file di configurazione ssl.conf di apache.

Per prima cosa modifichiamo le direttive del VirtualHost modificando i parametri **DocumentRoot** e **ServerName:**

```bash
<VirtualHost _default_:443>
...
DocumentRoot "/var/www/html"
ServerName www.example.com:443
...
```

Per far usare la coppia chiave/certificato dobbiamo disabilitare le direttive SSLProtocol e SSLCipherSuite eliminandole o commentandole. Cerchiamo ora le direttive SSLCertificateFile e SSLCertificateKeyFile andando a inserire i file generati:

```bash
SSLCertificateFile /etc/ssl/certs/apache.crt
SSLCertificateKeyFile /etc/ssl/private/apache.key
```

Come ultima cosa dobbiamo aggiungere sempre al ssl.conf dei parametri per rendere facile da raggiungere e più sicuro il sito, da aggiungere dopo la chiusura della direttiva VirtualHost:

```bash
. . .
</VirtualHost>
. . .

SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH
SSLProtocol All -SSLv2 -SSLv3
SSLHonorCipherOrder On
Header always set Strict-Transport-Security "max-age=63072000; includeSubdomains"
Header always set X-Frame-Options DENY
Header always set X-Content-Type-Options nosniff
SSLCompression off
SSLUseStapling on
SSLStaplingCache "shmcb:logs/stapling-cache(150000)"
```

A questo punto possiamo salvare il file e chiudere.

Per ridirezionare le richieste http a https dobbiamo creare il file di configurazione non-ssl.conf sempre in /etc/httpd/conf.d/ :

```bash
sudo touch /etc/httpd/conf.d/non-ssl.conf
```

All'interno di questo file andiamo a inserire il redirect:

```bash
<VirtualHost *:80>
        ServerName www.example.com
        Redirect "/" "https://www.example.com/"
</VirtualHost>
```

Per attivare il certificato e iniziare a usare la ssl encryption dobbiamo eseguire il restart del server e ricaricare tutte le configurazioni e moduli.

Per prima cosa analizziamo se nei file di configurazione ci sono degli errori:

```bash
sudo apachectl configtest
```

Se tutto va bene in output si avrà un **Syntax OK.**

A questo punto eseguiamo il restart del servizio:

```bash
sudo systemctl restart httpd.service
```
