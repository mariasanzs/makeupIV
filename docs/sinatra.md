# Justificación técnica del framework SINATRA y documentación sobre cómo se usa en la práctica.

Puedes acceder a la documentación de Sinatra [aquí](http://sinatrarb.com/documentation.html) y a su repositorio en GitHub [aquí](https://github.com/sinatra/sinatra)

Ruby posee diversos frameworks, lo que hace que sea un lenguaje muy potente para el desarrollo de una API, en mi caso personal he decidido usar Sinatra por las razones que se verán más adelante.

## Sobre Sinatra:

Es un DSL ( domain-specific language) escrito en Ruby y que destaca por la relación simplicidad-funcionalidad que ofrece.

###¿Qué ventajas nos ofrece Sinatra?

Sinatra tiene una gran popular entre los desarrolladores de Ruby, siendo así que además ha servido para crear otros frameworks esto es debido a los siguientes factores:

* Es Open Source
* Se hace destacar por su uso simple (muy similar al framework Flask de Phyton)
* Es flexible y rápido
* Mnimiza la dificultad en la creación de la aplicación web al no seguir el modelo vista controlador
* Ademas Sinatra soporta todos las funcionalidades que se necesitan para poner en marcha el proyecto ( Content types, rutas, verbos http...)

### Otras alternativas a Sinatra

Como ya habíamos comentado, hay otras muchas opciones de framework para Ruby, algunas son estas:

* Ruby on Rails: Es mucho más compleja que Sinatra y no es necesario para las necesidades de nuestra API
* Padrino : Está muy relacionado con Sinatra ya que está desarrollado sobre este. Puedes ver documentación sobre él [aquí](http://padrinorb.com/). Es una muy buena opción pero no es necesario un framework tan robusto para nuestro caso particular.
* Roda: Destaca por su enrutamiento siguiendo una estructura de árbol lo que hace que tenga muy buen rendimiento. Sin embargo solo se adapta bien a proyecto pequeños y no dispone de un marco completo.
* Otros conocidos son: Hanami (Bastante Popular), Merb, Nitro, Campaign, Cuba ...

Puedes encontrar comparaciones entre diferentes Frameworks de Ruby en cuanto a popularidad,uso , actualizaciones y demás [aquí]

## Poner en marcha Sinatra

Deberemos instalar la gema de Sinatra, esto lo podemos hacer bien ejecutando 

> gem install sinatra

o en nuestro caso, al disponer de Bundler, haciedno 

> bundle add sinatra

Una vez tenemos hecho esto podremos crear nuestro fichero .rb que contenga la aplicación, en nuestro caso el fichero es [este](https://github.com/mariasanzs/makeupIV/blob/master/sinatra/myapp.rb)

Para crear cada una de las rutas solo debemos indicar la petición que se va a realizar (get, post, delete, put...) su ruta y la correspondiente petición que realice. Por ejemplo:

~~~
get '/infraestructuravirtual' do
  "Este es el hito 6 de la asignatura infraestructura virtual"
end
~~~

Para ejecutar la aplicación pode



y ejecutar dicho código, de esta forma, tendremos disponible ahora en nuestro localhost el servicio.


