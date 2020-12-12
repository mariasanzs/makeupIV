#DOCUMENTACIÓN DEL DESARROLLO DE LA API

## Puesta en marcha de la aplicación: 

Lo primero que debemos de hacer es 

## Rutas asociadas a historias de usuario:

A la hora de hacer el diseño se han creado varias rutas asociadas a distinas historias de usuario y para las que se usan varios tipos de peticiones.

* Para la [HU01](https://github.com/mariasanzs/makeupIV/issues/9)

* Para la [HU02](https://github.com/mariasanzs/makeupIV/issues/10)

* Para la [HU03](https://github.com/mariasanzs/makeupIV/issues/12)

* Para la [HU04](https://github.com/mariasanzs/makeupIV/issues/13)

* Para la [HU05](https://github.com/mariasanzs/makeupIV/issues/32)

* Para la [HU06](https://github.com/mariasanzs/makeupIV/issues/42)

* Para la [HU08](https://github.com/mariasanzs/makeupIV/issues/53)

## Test de la API

Puedes consultar todos los test del archivo MyApp.rb en el fichero [testMyapp.rb](https://github.com/mariasanzs/makeupIV/blob/master/spec/testMyapp.rb)

Para realizar los test se ha seguido la siguiente [guía](http://sinatrarb.com/testing.html) para Rspec, que es el marco para test que se usa en el proyecto.

Probar Sinatra con RSpec es bastante simple, sólo deberemos de usar el la propia biblioteca de pruebas de Rack, Rack::Test (necesitamos la gema rack-test) e ir creando bloques describe para cada una de las posibles rutas que deberemos testear.

Lo primero que hacemos es indicar a sinatra el entorno en el que estamos trabando (test)

> ENV['APP_ENV'] = 'test'

Tras esto indicamos todas las rutas a archivos o librerías necesarias 

y añadimos la clase ´Rack :: Test :: Methods´ que proporciona métodos auxiliares para realizar las pruebas.

La sintaxis para cada bloque describe siempre es muy similar a la siguiente:
~~~
 describe "Función de este test" do
    it 'caso ok' do
      get '/ruta' # o cualquier otra petición
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end

    it 'caso error' do
      get '/rutaconfallo'
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end
  end
~~~

La línea expect(last_response).to be_ok equivale a decir que se ha devuelto el estado 200

### Test realizados:

Para el caso de nuestro archivo en particular se han realizado test para cubrir los métodos realizados en [Myapp.rb](https://github.com/mariasanzs/makeupIV/blob/master/sinatra/myapp.rb) asociados a historias de usuario.

* Para la [HU01](https://github.com/mariasanzs/makeupIV/issues/9)

Se describe el test "Disponibilidad de un producto" para comprobar la ruta ´get '/disponibilidad/:producto'´, en el que se testean los casos de éxito "Disponibilidad ok" y los de error "Disponibilidad error" para el caso en el que no existe el producto dado

* Para la [HU02](https://github.com/mariasanzs/makeupIV/issues/10)

Se describe el test "Características de un producto" para comprobar la ruta ´get '/caracteristicas/:producto'´, en el que se testean los casos de éxito "Características ok" y los de error "Características error" para el caso en el que no existe el producto dado

* Para la [HU03](https://github.com/mariasanzs/makeupIV/issues/12)

Se describe el test "Tonos disponibles de un producto" para comprobar la ruta ´get '/tonos/:producto'´, en el que se testean los casos de éxito "Tonos ok" y los de error "Tonos error" para el caso en el que no existe el producto dado

* Para la [HU04](https://github.com/mariasanzs/makeupIV/issues/13)

Se describe el test "Porcentaje descuento de un producto" para comprobar la ruta ´get '/descuento/:producto'´, en el que se testean los casos de éxito "Descuento ok" y los de error "Descuento error no existe producto" para el caso en el que no existe el producto dado

* Para la [HU05](https://github.com/mariasanzs/makeupIV/issues/32)

Se describe el test "Canjear código de un producto" para comprobar la ruta ´get /producto/:producto/canjearCodigo/:codigo´, en el que se testean los casos de éxito "Canjear código ok" y los de error "Canjear código error no existe producto" para el caso en el que no existe el producto dado y "Canjear código error no existe código" para cuando es un código que no es válido para el producto dado.

* Para la [HU06](https://github.com/mariasanzs/makeupIV/issues/42)

Se describe el test "precios de la cesta" para comprobar la ruta ´get /preciocesta´, en el que se testea el caso de éxito "Precio cesta ok".

Se describe el test "Insertar un producto en la cesta" para comprobar la ruta ´post /anadirCesta/:prueba´, en el que se testean los casos de éxito "añadir cesta ok" y los de error "añadir cesta error no existe producto" para el caso en el que no existe el producto dado.

Se describe el test "Quitar un producto en la cesta" para comprobar la ruta ´delete /quitarCesta/:prueba´, en el que se testean los casos de éxito "quitar cesta ok" y los de error "quitar cesta error no existe producto" para el caso en el que no existe el producto dado y "añadir cesta error no está en la cesta" para cuando no está en la cesta el producto pasado.

* Para la [HU08](https://github.com/mariasanzs/makeupIV/issues/53)

Se describe el test "Quitar un producto del almacen" para comprobar la ruta ´post /anadirCesta/:prueba´, en el que se testean los casos de éxito "quitar almacen ok" y los de error "Quitar producto error no está en Almacen" para el caso en el que no se encuentra ese producto en el almacén.

Para el caso de Error 404 y '/' también se han creado los test "Hay un error 404" y "Pagina Inicial" respectivamente

Por último para ejecutar los test de integración concretos de la app podemos hacer 

> rake test_app

## Registro en un archivo de log de todas las peticiones realizadas

Se ha creado un fichero de log haciendo uso de un middleware y que puede consultar [aquí
###PON LA RUTA




