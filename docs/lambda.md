# Uso de AWS Serverless Ruby para la creación de funciones en un bot de Telegram

Se ha decidido usar la plataforma AWS porque es la plataforma que mejores opciones ofrece a la hora de crear un bot con el lenguaje Ruby, el cual no tiene mucha versatilidad en el mundo serverless. Otra opción podría haber sido el uso de Google Clouds Functions pero no hay ni la misma documentación ni las mismas buenas opiniones para el uso con Ruby que con AWS.

Por otro lado es una oportunidad para comenzar a usar AWS, que tiene muchos más servicios a parte de este y puede resultar muy interesante a nivel de aprendizaje, aunque algo complejo en comparación con otros como Vercel o Netlify.

## Darse de alta en AWS

Es un proceso bastante sencillo simplemente debes registrarte añadiendo tus datos, el único inconveniente es que debes meter también una tarjeta de crédito, pero el primera año es gratuito, simplemente te cobran de forma simbólica 1$.

También existe la posibilidad de registrarse con AWSeducate, que es gratuito al pertenecer a la universidad, sin embargo para lo que vamos a realizar no es válido ya que no permite ciertas cosas como el tema de los credenciales que veremos después

## Instalar serverless para trabajar de forma local:

Instalamos el Serverless framework con el siguiente comando:

> curl -o- -L https://slss.io/install | bash

![installserverlessframwork](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/installserverlessframework.png)

Una vez está instalado creamos un nuevo servicio ejecutando el siguiente comando y añadimos la plantilla para AWS lambda y Ruby:

> serverless create --template aws-ruby --path makeup-bot-iv

![serverlesscreate](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/serverlesscreate.png)

Dentro de la carpeta que hemos creado llamada makeup-iv-bot viene toda la configuración del servicio dentro del archivo [serverless.yml](https://github.com/mariasanzs/makeupIV/blob/master/makeup-iv-bot/serverless.yml), en el que hemos sobreescrito el código generado por defecto. Puedes ver una pequeña explicación de este fichero [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/serverless-yml.md)

También deberíamos de configurar nuestro archivo [handler.rb](https://github.com/mariasanzs/makeupIV/blob/master/makeup-iv-bot/handler.rb) en el que irán todas las funciones y que está explicado [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/handler-rb.md), aunque esto podemos dejarlo por defecto ahora y desarrollarlo una vez lo tengamos todo.

Cuando ya hemos realizado estos pasos, y antes de hacer el despliegue, debemos de configurar serverless introduciendo unos credenciales (una llave y su clave) que deberíamos de tener creada con anterioridad.

![serverlessconfig](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/serverlessconfig.jpg)

Con respecto a como se han conseguido ese par de valores, en AWS se puede hacer de dos formas ambas en la sección "mis credenciales de seguridad" :
	- primera opción: Usar nuestro propio usuario y generar una clave de acceso (ID de clave de acceso y clave de acceso secreta)
	- segunda opción: Crear un nuevo usuario y asignarle una política que creemos nosotros con los permisos que necesitemos ( a este tipo de usuario se le conoce como IAM). Los pasos para realizar esto son un tanto extensos y no tan relevantes, así que dejo un [tutorial de como crear un usuario IAM](https://www.serverless.com/framework/docs/providers/aws/guide/credentials/)

Hacemos
> serverless deploy
 para realizar el despliege del serverless

![serverlessdeploy](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/serverlessdeply.png)

Es importante tener recordar que al final del serverless deploy se nos da una URL, esta deberemos guardarla para realizar el WebHook como veremos después

Una vez tenemos el deployment hecho y si no ha habido problemas, podemos ver todo lo que ha sido generado en la consola de AWS.

-> En cloudFormation podemos ver como Serverless Framework crea una pila por cada entorno del servicio (nosotros tenemos solo uno) y dentro de esta (en 'resources') como se han generado varios recursos diferentes.

![cloudFormation](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/cloudFormation.png)
![resources](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/Resources.png)

-> En la sección S3 (almacenamiento escalable en la nube) encontraremos un nuevo depósito para el servicio, que almacena el código de función empaquetado junto con la plantilla de CloudFormation compilada

![s3objetos2](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/s3objetos2.png)

## Creación del bot de Telegram

Para la creación del bot de telegram simplemente deberemos de iniciar un chat con BotFather y enviar el comando `/newbot`, nos preguntará por el nombre y demás de nuestro bot y nos dará como resultado el propio bot y el token para acceder al HTTP API.

![botTelegram](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/botTelegram.jpg)

## Creación de un WebHook para conectar el bot a la función lambda

Como habíamos dicho antes, al hacer deploy se nos devuelve una URL en la sección `endpoints`, esta la usaremos para crear el Web Hook con el siguiente comando:

> curl --request POST --url https://api.telegram.org/bot<TOKEN DE TELEGRAM>/setWebHook --header 'content-type: application/json' --data '{"url": "<URL DEL DEPLOY>"}'

![webHook](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/wehook.jpg)

y ya estaría creado el Web Hook y podríamos probar nuestro bot

El link al bot está [aquí](t.me/makeup_iv_bot), prueba comandos como `/misdatos mariasanz@correo.ugr.es` o `/listaproducto Hollywood Flawless Filter - Charlotte Tilbury`

## Creación de un script en git Hook para automatizar los deploy al hacer push

AWS Lambda tiene el inconveniente de que no permite automatizar los despliegues en cada push que se actualiza en el sistema, por ello para realizar dicho despligue se hace uso de un git hook que es simplemente un script que se ejecuta justo antes del push siempre que se realiza
dicho script simplemente se traslada a la carpeta en la que está el archivo serverless y hace 
> serverless deploy
tal y como se muestra en la captura.

![script githoook](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/pre-push.png)

De esta forma siempre que hacemos push se ejecutará

---
#### Enlaces que me han sido útiles:
- Empecé siguiendo este [vídeo](https://www.youtube.com/watch?v=_aLMx7OFt5M) que me ayudó sobre todo a crear serverless.yml y manejar el framework de AWS, el repositorio de ese bot está [aquí](https://github.com/mkdev-me/germanizer)

- [Bot de telegram con AWS y Ruby](https://github.com/jensendarren/telegram-bot-serverless)




