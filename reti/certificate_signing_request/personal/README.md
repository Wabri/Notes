# Certificate signing request

Un CSR è necessario per garantire un certificato SSL/TLS e viene generato nello stesso server dove è contenuto il certificato.

Il CSR contiene informazioni che poi verranno usate dal CA (Certificate Authority) per creare il certificato.

Contiene anche la chiave publica inclusa nel certificato ed è firmta con la corrispondente chiave privata.

Il CA userà i dati del CSR per generare il certificato SSL, i dati contenuti sono:

1. Informazioni del business e del ito che stiamo cercando di certificare:
    - Common Name (CN) = Il nome completo del dominio (fully qualified domain name = FQDN) del server. Esempi: [www.example.com](http://www.example.com) o mail.example.com.
    - Organization (O) = Il nome legale dell'organizzazione per cui richiediamo la certificazione.
    - Organizational Unit (OU) = la divisione che gestisce il certificato.
    - City/Locality (L) = La città dove l'organizzazione è localizzata. (NON ABBREVIARE)
    - State/County/Region (S) = Lo stato o regione dove l'organizzazione si localizza (NON ABBREVIARE)
    - Country (C) = Codice di 2 lettere che indica dove l'organizzazione si localizza.
    - Email Address = Un indirizzo mail usato per contattare l'organizzazione.
2. La chiave pubblica che deve essere inclusa nel certificato = SSL usa public-key o asymmetric cryptography per trasmettere in modo criptato i dati durante una sessione SSL.
3. Informazioni relativa al tipo e alla lunghezza della chiave. Comunemente la lunghezza della chiave è RSA 2048, ma in alcuni casi è possibile che alcune CAs supportino anche chiavi RSA 4096+ o ECC.

Il CSR è normalmente creato in Base-64 basato sul formato PEM.

## Link utili

[https://www.sslshopper.com/what-is-a-csr-certificate-signing-request.html](https://www.sslshopper.com/what-is-a-csr-certificate-signing-request.html)
