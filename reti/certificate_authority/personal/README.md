# CA

Nella crittografia un certificate authority o certification authority è un'entità che si occupa di certificati digitali. Un certificato digitale certifica il possesso di una chiave pubblica dal nome del soggetto del certificato. Questo permette ad altri di fare affidamento sulle firme o su asserzioni fatte tramite la chiave privata che corrisponde alla chiave pubblica certificata. Un CA agisce come una terza parte su cui entrambi i soggetti fanno affidamento, sia il possessore del sito sia l'utente finale.

Un comune uso delle CA è di certificare i certificati usati per HTTPS (il protocollo di navigazione sicuro per il www).

## Come funziona

Per richiedere un certificato SSL a un CA è necessario inviare un [CSR](../../certificate_signing_request/README.md), in ritorno sarà restituito un certificato creato a partire dal suo root certificate e dalla sua chiave privata. Ogni browser possiederà una copia del certificato usato dalle maggiori CA, in questo modo è possibile verificare se il certificato della pagina raggiunta sia valido o no.

## Come creare una CA

è possibile generare una certificate authority fittizia per lo sviluppo locale. Per prima cosa generiamo la chiave privata della ca:

```bash
openssl genrsa -des3 -out ca.key 2048
```

Poi generiamo il certificato root da cui discenderanno tutti i certificati per le pagine che certifichiamo:

```bash
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1825 -out ca.pem
```

Una volta creata la pem è possibile aggiungere questa ca a quelle riconosciute dal sistema utilizzando il comando security:

```bash
sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" ca.pem
```

(Questo su mac, su linux è necessario aggiungere il certificato sotto /usr/share/ca-certificates/<nome_dominio>/<certificato> e poi riconfigurare i certificati con il comando dpkg-reconfigure ca-certificates)
