https://www.youtube.com/watch?v=_aLMx7OFt5M
https://github.com/mkdev-me/germanizer

Instalamos el Serverless framework con el siguiente comando

curl -o- -L https://slss.io/install | bash

![installserverlessframwork](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/installserverlessframework.png)

Una vez está instalado creamos un nuevo servicio ejecutando el siguiente comando y añadimos la plantilla para AWS lambda y Ruby:

serverless create --template aws-ruby --path makeupIV

![serverlesscreate](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/serverlesscreate.png)

Dentro de la carpeta que hemos creado llamada makeupIV viene toda la configuración del servicio dentro del archivo [serverless.yml](nohaylink)

Sobreescribiremos el código generado e insertaremos nosotros la configuración:

//archivo credenciales
https://gist.githubusercontent.com/ServerlessBot/7618156b8671840a539f405dea2704c8/raw/a76e80cdbf2e9808352c3fec79a9625fa345a00d/IAMCredentials.json

---


---

Una vez tenemos el deployment hecho vamos a ver lo que tenemos en la consola de AWS
Primero, en cloudFormation vemos como Serverless Framework crea una pila por cada entorno del servicio (nosotros tenemos solo uno)
Si entramos dentro , en la sección 'resources' vemos que se han creado 10 recursos diferentes.

Si ahora nos vamos a la sección S3 (almacenamiento escalable en la nube) encontraremos un nuevo depósito solo para este servicio, que almacena el código de función empaquetado junto con la plantilla de CloudFormation compilada






