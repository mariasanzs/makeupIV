# Explicación del fichero serverless-yml

Puedes acceder a dicho fichero [aquí](https://github.com/mariasanzs/makeupIV/blob/master/makeup-iv-bot/serverless.yml)

### Contenido del fichero 

~~~

service: makeupiv
frameworkVersion: '2'

provider:
  name: aws
  runtime: ruby2.7
  apiGateway:
    shouldStartNameWithService: true
  stage: dev
  region: eu-west-3
  memorySize: 128

functions:
  datospersonales:
    handler: handler.datospersonales
    description: "Muestra los datos personales de un cliente"
    events:
      - http:
          path: /
          method: post
          cors: true

~~~

En el fichero espedcificamos el nombre que va a tener nuestro servicio y luego en la sección provider especificamos el encargado de correr dicho servicio. En esa misma sección especificamos páramtros como la región (que aparece en nuestra consola de AWS) o apiGetway: que simplemente lo usamos para evitar warnings y problemas en el servicio.

También tenemos la sección Functions, en la que damos el nombre de nuestra función (aunque tengamos una puede realizar varias funciones), también debemos de definir el handler que indica el código que deberemos ejecutar en el archivo [handler.rb](https://github.com/mariasanzs/makeupIV/blob/master/makeup-iv-bot/handler.rb). 

Por último, como nuestra aplicación va a hacer uso de un WebHook por lo que necesitaremos de POST, y además habilitamos cors, que permite especificar dominios seguros y habilita el soporte para usar las solicitudes HTTP ( esto se verá reflejado con un método options que aparecerá junto con el post en nuestra consola de AWS)
