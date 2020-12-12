#DOCUMENTACIÓN DEL DESARROLLO DE LA API

Para desarrollar la aplicación he usado Sinatra, puedes ver alguna documentación que he desarrollado sobre la elección de este y su uso [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/sinatra.md#justificaci%C3%B3n-t%C3%A9cnica-del-framework-sinatra-y-documentaci%C3%B3n-sobre-c%C3%B3mo-se-usa-en-la-pr%C3%A1ctica)

## Puesta en marcha de la aplicación: 

Lo primero que debemos de hacer es añadir todas las rutas necesarias para el funcionamiento de la aplicación y crear una clase (en mi caso Myapp) que hereda de la clase Sinatra::Base que ofrece funciones que se pueden habilitar y facilitan el uso de Sinatra.

~~~

require 'sinatra'
require 'json'
require 'logger'

require_relative '../src/almacen.rb'
require_relative '../src/compra.rb'

class MyApp < Sinatra::Base

  log = ::Logger.new(File.join(File.dirname(File.expand_path(__FILE__)),'.','log','info.log'))

  configure do
    use ::Rack::CommonLogger, log
  end
~~~

Con respecto a todo lo relacionado con 'log', podemos ver [aquí](LINK) un poco mejor sobre el uso de un middleware para la creación de un fichero log

~~~

Al no disponer de persistencia en la aplicación se han creado las siguientes estancias de clase para poder testear las rutas, además de esto se han declarado las dos clases que funcianarán como clases controladoras ( Almacén y Compra)

~~~

  @@cliente = 'clientepordefecto'
  @@almacen = Almacen.new
  @@obj = Maquillaje.new('prueba',[4, 5, 6, 7],10.0,5.0,[3, 2, 1, 7],TipoProducto::LABIOS,[['maria15','labios30'],[15,30]])
  @@almacen.anadirProducto(@@obj)
  @@cesta = Compra.new(@@cliente)

~~~

También deberemos de crear unas rutas para funcionalidades generales:

Para que aparezca al iniciar el servidor en:

>  http://localhost:9292
~~~
  get '/' do
    log.info "Accediendo a la página principal de MakeupIV"
    {:status => 'ok'}.to_json
  end
~~~

Y para el caso en el que no se encuentre la ruta dada devolviendo el estado 404 (Not Found):

~~~
  error 404 do
    content_type :json
    log.info "ERROR!!! -> ruta no encontrada"
    {:status => 'Error: ruta no encontrada'}.to_json
  end
~~~

Podemos probarlo haciendo: 

> http://localhost:9292/noexisto

## Rutas asociadas a historias de usuario:

A la hora de hacer el diseño se han creado varias rutas asociadas a distinas historias de usuario y para las que se usan varios tipos de peticiones (GET, POST y DELETE)

* Para la [HU01](https://github.com/mariasanzs/makeupIV/issues/9)

Especificamos la ruta: get /disponibilidad/:producto siendo producto el nombre de un producto del que queremos consultar su disponibilidad.

Buscamos el producto que corresponde con ese nombre y consultamos cuantas unidades quedan de dicho producto. En caso de que se produzca algún error durante estas funciones se manejan las excepciones y se muestra el resultado al usuario devolviendo también un estado de éxito (200) o de error (400).
~~~

  get '/disponibilidad/:producto' do
    content_type :json
    nombreproducto = params['producto'].to_s
    begin
      res = @@almacen.buscarProducto(nombreproducto).consultarUnidadesDisponibles()
      log.info "Accediendo a la disponibilidad de un producto"
      status 200
      {:unidadesDisponibles => res}.to_json
    rescue StandardError
      log.info "ERROR!!! -> Accediendo a la disponibilidad de un producto"
      status 400
      {:status => "Error: no hay disponibilidad de este producto"}.to_json
    end
  end

~~~

Podemos probar esta ruta poniendo en marcha el servicio y haciendo:

> http://localhost:9292/disponibilidad/prueba en el navegador

o

> curl --header "Content-Type:application/json" --request GET --data '{"producto":"prueba"}' https://localhost:9292/disponibilidad/prueba



* Para la [HU02](https://github.com/mariasanzs/makeupIV/issues/10)

El código para esta historia de usuario es muy similar al anterior, solo que esta vez se llama a la función que lista las características de un producto.

Puedes probar la ruta iniciando el servicio y haciendo:

> http://localhost:9292/características/prueba en el navegador

o

> curl --header "Content-Type:application/json" --request GET --data '{"producto":"prueba"}' https://localhost:9292/caracteristicas/prueba



* Para la [HU03](https://github.com/mariasanzs/makeupIV/issues/12)

Nuevamente la ruta es una petición get muy similar a las anteriores, pero en este caso se llama a la función que de makeupiv.rb que muestra los tonos en los que está disponible un producto.

> http://localhost:9292/tonos/prueba en el navegador

o

> curl --header "Content-Type:application/json" --request GET --data '{"producto":"prueba"}' https://localhost:9292/tonos/prueba


* Para la [HU04](https://github.com/mariasanzs/makeupIV/issues/13)

En este caso se muestra el tanto por ciento de descuento que se aplica a un producto siguiendo el mismo esquema de código mediante una petición GET

> http://localhost:9292/descuento/prueba en el navegador

o

> curl --header "Content-Type:application/json" --request GET --data '{"producto":"prueba"}' https://localhost:9292/descuento/prueba


* Para la [HU05](https://github.com/mariasanzs/makeupIV/issues/32)

Especificamos la ruta: get /producto/:producto/canjearCodigo/:codigo. `Producto` es el nombre del producto al que le queremos aplicar un código de descuento `codigo`

Buscamos el producto y consultamos si dicho código de descuento se le puede aplicar, en caso afirmativo se devuelve el precio rebajado y un estado de éxito ( status 200 ) en caso que o bien el producto o bien el código no sean válidos se devuelve error (status 400)

~~~
  get '/producto/:producto/canjearCodigo/:codigo' do
    content_type :json
    begin
      n_codigo = params['codigo']
      nombreproducto = params['producto']
      prod = @@almacen.buscarProducto(nombreproducto)
      begin
        res = prod.canjearCodigo(n_codigo)
        log.info "Canjeando código de un producto"
        status 200
        {:preciorebajado => res}.to_json
      rescue StandardError
        status 400
        log.info "ERROR!!! -> Canjeando código de un producto"
        {:status => 'Error: Este código no es válido'}.to_json
      end
    rescue StandardError
      status 400
      {:status => 'Error: Este producto no está en el catálogo'}.to_json
    end
  end
~~~

Puedes probarlo poniendo en marcha el servidor y haciendo:

> http://localhost:9292/producto/prueba/canjearCodigo/maria15 en el navegador

o

> curl --header "Content-Type:application/json" --request GET --data '{"producto":"prueba", "canjearCodigo":"maria15"}' https://localhost:9292/producto/canjearCodigo/maria15


* Para la [HU06](https://github.com/mariasanzs/makeupIV/issues/42)

El caso de la HU es algo diferente ya que deberemos de especificar diferentes rutas:

**get /preciocesta :**

Al igual que en los casos anteriores, se devuelve un estado de éxito con el valor total de todos los productos añadidos a la cesta.

Puedes probarlo haciendo:

> http://localhost:9292/preciocesta

curl --header "Content-Type:application/json" --request GET http://localhost:9292/preciocesta

**post /anadirCesta/:producto :**

Esta vez se realiza una petición POST ya que se modificará el valor de la instancia de clase @@cesta añadiendo a ella un producto.

Aún así, debido a la simplicidad que aporta Sinatra, el caso sigue siendo muy similar a los casos anteriores.

>curl --header "Content-Type:application/json" --request POST --data '{"producto":"prueba"}' http://localhost:9292/anadirCesta/producto

**delete /quitarCesta/:producto :**

Al igual que podemos añadir productos a la cesta también tenemos que poder quitarlos de esta, por ello debemos de realizar una petición DELETE para eliminar el producto que se encuentra dentro de la cesta.

Para probarlo en el servidor deberíamos de hacer:

>curl --header "Content-Type:application/json" --request DELETE --data '{"producto":"prueba"}' http://localhost:9292/quitarCesta/producto


* Para la [HU08](https://github.com/mariasanzs/makeupIV/issues/53)

Para esta última Historia de usuario solo se ha implementado el caso en el que se quitar un producto del almacén haciendo también una petición DELETE al igual que ocurría en el caso anterior. La ruta es la siguiente: delete '/quitarProducto/:producto'

Puedes probar la ruta iniciando el servidor y haciendo curl:

> curl --header "Content-Type:application/json" --request DELETE --data '{"producto":"prueba"}' http://localhost:9292/quitarProducto/producto


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

Por último para ejecutar los test de integración podemos hacer 

> rake test

## Registro en un archivo de log de todas las peticiones realizadas

Se ha creado un fichero de log haciendo uso de un middleware y que puede consultar [aquí](https://github.com/mariasanzs/makeupIV/tree/master/sinatra/log). También puedes consultar toda la documentación de como he realizado esto haciendo click [aquí]() |||||||||||||||||||||||||||||||||||||||||||||||PON RUTA




