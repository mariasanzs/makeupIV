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

export AWS_ACCESS_KEY_ID=AKIA54NTP7MRLJEOLGEN
export AWS_SECRET_ACCESS_KEY=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
serverless plugin install --name serverless-hooks-plugin

ID de clave de acceso:
AKIAI6M4SBJ22YZJNMZQ
Clave de acceso secreta:
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





