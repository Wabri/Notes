# Artifactory

## Creare un'istanza docker con artifactory

Creare directory contenente la home di artifactory:

```Bash
mkdir jfrog
```

Definire le directory artifactory/var/etc/ e artifactory/var/bootstrap/artifactory/tomcat/lib:

```Bash
mkdir -p artifactory/var/etc/
mkdir -p artifactory/var/bootstrap/artifactory/tomcat/lib
```

Creiamo ora il file di configurazione:

```Bash
touch artifactory/var/etc/system.yaml
```

Il file contiene le configurazioni che è possibile usare per personalizzare artifactory:

```Yaml
shared:
	extraJavaOpts: "-Xms512m -Xmx4g"
	node:
		ip: 10.150.0.222
		id: nodeone
		haEnabled: true
		taskAffinity: any
```

## Referece

- [articactory-installation-quick-start-guide-docker](https://jfrog.com/knowledge-base/artifactory-installation-quick-start-guide-docker/)
