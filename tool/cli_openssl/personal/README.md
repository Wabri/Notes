# OpenSSL

Strumento opensource che implementa il protocollo SSL. Usato per creare csr (Certificate Signing Request) e key per differenti  piattaforme incluso apache. Ha tantissime funzionalità diverse che permettono di: 

- visionare i dettagli di un CSR o di un certificato,
- confrontare un MD5 hash di un certificato e la chiave privata per assicurarsi che corrispondano,
- verificare che il certificato sia installato in un qualsiasi sito,
- convertire i certificati in diversi formati.

# Comandi generici

## Generare una nuova chiave privata e un nuovo CSR

```bash
openssl req -out CSR.csr -new -newkey rsa:2048 -nodes -keyout privateKey.key
```

- **-newkey rsa:2048** ci dice che vogliamo creare sia un certificato che una chiave di lunghezza 2048
- **-nodes** impedisce che il certificato venga bloccato da una passphrase

## Generare un certificato self-signed

```bash
openssl \
	req -x509 -sha256 -nodes -days 365
  -newkey rsa:2048 -keyout privateKey.key
	-out certificate.crt
```

- **req** è un sottocomando di openssl per specificare il cerficato con cui le richieste vengono gestite
- **-x509** tipo di certificato self-signed richiesto
- **-sha256** tipo di algoritmo sha da usare
- **-nodes** impedisce che il certificato venga bloccato da una passphrase
- **-days 365** è l'argomento che determina per quanti giorni il certificato rimarrà valido
- **-newkey rsa:2048** ci dice che vogliamo creare sia un certificato che una chiave di lunghezza 2048
- **-keyout** come deve essere chiamata la chiave restituita
- **-out** dove il certificato deve essere creato

## Generare un CSR a partire da una chiave privata già esistente

```bash
openssl req -out CSR.csr -key privateKey.key -new
```

## Generare un CSR basato su un certificato già preesistente

```bash
openssl x509 -x509toreq -in CRT_CA.crt -out CSR.csr -signkey privateKey.key
```

## Rimuovere una passphrase da una chiave privata

```bash
openssl rsa -in privateKey.pem -out newPrivateKey.pem
```

# Controllare la validità dei certificati/chiavi

## Controllare un CSR

```bash
openssl req -text -noout -verify -in CSR.csr
```

## Controllare una chiave privata

```bash
openssl rsa -in privateKey.key -check
```

## Controllare un certificato

```bash
openssl x509 -in certificate.crt -text -noout
```

## Controllare un file PKCS#12

```bash
openssl pkcs12 -info -in keyStore.p12 
```

# Debuggare i certificati e le chiavi

## Controllare un MD5 hash di una chiave pubblica per assicurarsi che sia congruente con quello di una CSR o di una chiave privata

```bash
openssl x509 -noout -modulus -in certificate.crt | openssl md5
openssl rsa -noout -modulus -in privateKey.key | openssl md5
openssl req -noout -modulus -in CSR.crt | openssl md5
```

## Controllare una connessione SSL e visualizzare tutti i certificati

```bash
openssl s_client -connect <sito>:443
```

# Conversione usando openssl

## Convertire DER a PEM

```bash
openssl x509 -inform der -in certificate.cer -out certificate.pem
```

## Convertire PEM a DER

```bash
openssl x509 -outform der -in certificate.pem -out certificate.der
```

## Convertire un PKCS#12 contenente una chiave privata e un certificato a PEM

```bash
openssl pkcs12 -in keyStore.pfx -out keyStore.pem -nodes
```

## Convertire un certificato PEM e una chiave privata a PKCS#12

```bash
openssl pkcs12 -export -out certificate.pfx \
		-inkey privateKey.key 
		-in certiticate.crt 
		-certfile CACert.crt
```
