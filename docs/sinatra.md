# Justificación técnica del framework SINATRA y documentación sobre cómo se usa en la práctica.

Puedes acceder a la documentación de Sinatra [aquí](http://sinatrarb.com/documentation.html) y a su repositorio en GitHub [aquí](https://github.com/sinatra/sinatra)

## Sobre Sinatra:

Es un DSL ( domain-specific language) escrito en Ruby

###¿Qué ventajas nos ofrece Sinatra?

* Open Source
* Uso simple similar a flask
* Flexible y rápido
* Mnimiza la dificultad en la creación de la aplicación web al no seguir el modelo vista controlador
* Ademas Sinatra soporta todos las funcionalidades que se necesitan para poner en marcha el proyecto ( Content types, rutas, verbos http...)

### Otras alternativas a Sinatra

* Padrino
* Ruby on Rails
* Merb
* Nitro
* Campaign

## Poner en marcha Sinatra

Deberemos instalar la gema de Sinatra, esto lo podemos hacer bien ejecutando 

> gem install sinatra

o en nuestro caso, al disponer de Bundler, haciedno 

> bundle add sinatra

Una vez tenemos hecho esto podremos crear nuestro fichero .rb que contenga la aplicación, en nuestro caso el fichero es [este]

y ejecutar dicho código, de esta forma, tendremos disponible ahora en nuestro localhost el servicio.


