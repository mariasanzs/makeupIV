# Uso de AWS Serverless Ruby para la creación de funciones en un bot de Telegram

-------------introducción

----------Crear cuenta AWS


## Instalar serverless para trabajar de forma local:

Instalamos el Serverless framework con el siguiente comando:

> curl -o- -L https://slss.io/install | bash

![installserverlessframwork](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/installserverlessframework.png)

Una vez está instalado creamos un nuevo servicio ejecutando el siguiente comando y añadimos la plantilla para AWS lambda y Ruby:

> serverless create --template aws-ruby --path makeup-bot-iv

![serverlesscreate](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/serverlesscreate.png)

Dentro de la carpeta que hemos creado llamada makeup-iv-bot viene toda la configuración del servicio dentro del archivo [serverless.yml](https://github.com/mariasanzs/makeupIV/blob/master/makeup-iv-bot/serverless.yml), en el que hemos sobreescrito el código generado por defecto. Puedes ver una pequeña explicación de este fichero [aquí](LINNKKKKKKKKK)

También deberíamos de configurar nuestro archivo [handler.rb](https://github.com/mariasanzs/makeupIV/blob/master/makeup-iv-bot/handler.rb) en el que irán todas las funciones y que está explicado [aquí](link), aunque esto podemos dejarlo por defecto ahora y desarrollarlo una vez lo tengamos todo.

Cuando ya hemos realizado estos pasos, y antes de hacer el despliegue, debemos de configurar serverless introduciendo unos credenciales (una llave y su clave) que deberíamos de tener creada con anterioridad.

![serverlessconfig]()

Con respecto a como se han conseguido ese par de valores, en AWS se puede hacer de dos formas ambas en la sección "mis credenciales de seguridad" :
	- primera opción: Usar nuestro propio usuario y generar una clave de acceso (ID de clave de acceso y clave de acceso secreta)
	- segunda opción: Crear un nuevo usuario y asignarle una política que creemos nosotros con los permisos que necesitemos ( a este tipo de usuario se le conoce como IAM). Los pasos para realizar esto son un tanto extensos y no tan relevantes, así que dejo un [tutorial de como crear un usuario IAM](https://www.serverless.com/framework/docs/providers/aws/guide/credentials/)

Hacemos
> serverless deploy
 para realizar el despliege del serverless

![serverlessdeploy]()

Es importante tener recordar que al final del serverless deploy se nos da una URL, esta deberemos guardarla para realizar el WebHook como veremos después

Una vez tenemos el deployment hecho y si no ha habido problemas, podemos ver todo lo que ha sido generado en la consola de AWS.

	- En cloudFormation podemos ver como Serverless Framework crea una pila por cada entorno del servicio (nosotros tenemos solo uno) y dentro de esta (en 'resources') como se han generado varios recursos diferentes.

![cloudFormation](mcowmso)
![resources]()


	- En la sección S3 (almacenamiento escalable en la nube) encontraremos un nuevo depósito para el servicio, que almacena el código de función empaquetado junto con la plantilla de CloudFormation compilada

![s3objetos2]()

## Creación del bot de Telegram

Para la creación del bot de telegram simplemente deberemos de iniciar un chat con BotFather y enviar el comando `/newbot`, nos preguntará por el nombre y demás de nuestro bot y nos dará como resultado el propio bot y el token para acceder al HTTP API.

![botTelegram]()

## Creación de un WebHook para 

## Creación de un script en git Hook para automatizar los deploy al hacer push

---
#### Enlaces que me han sido útiles:
- Empecé siguiendo este [vídeo](https://www.youtube.com/watch?v=_aLMx7OFt5M) que me ayudó sobre todo a crear serverless.yml y manejar el framework de AWS, el repositorio de ese bot está [aquí](https://github.com/mkdev-me/germanizer)

- 




