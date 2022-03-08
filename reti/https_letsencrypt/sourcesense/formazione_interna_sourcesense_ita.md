# OVH/LETSENCRYPT

## Task Eseguiti

- Aggiunto come tipo di network bridge alla vm web_server_apache per fare in modo che abbia lo stesso ip della macchina locale
- Modificata la configurazione di httpd per fare in modo di rendere disponibile l'index.html
- Aggiunto su ovh un subdomain con il nome lab.gabriele.opentrekkers.com 
- Test del raggiungimento del sito
- Installato certbot per usarlo come client di generazione certificati approvati da letsencrypt per l'aimbiente apache
- Per problemi di firewall il certificato non viene generato, nonostante sia il firewall della vm che della macchina locale siano disabilitati
	Il comando eseguito è: `certbot certonly --apache -d lab.gabriele.opentrekkers.com --server https://acme-staging-v02.api.letsencrypt.org/directory` ho usato la API di test in modo da non rientrare nel range di rate limits e poter continuare a testare.
- Riprodotto stesso procedimento per il server con haproxy

## Obiettivi

- [x] Creare un record DNS in modo che ti risolva un'indirizzo locale
 a tua scelta (usa quello della vm dove hai messo HaProxy e Apache)
- [x] Usa Let's Encrypt per farti generare une bel certificato
- [/] Montiamolo sia su Apache che su HaProxy

