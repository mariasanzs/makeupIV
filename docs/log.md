# Uso de middleware para creación de un fichero log

Como ya hemos comentado en varias ocasiones, para realizar el proyecto se está haciendo uso de la interfaz Rack para frameworks de Ruby. Entre las capacidades de las que dispone Rack se encuentra la alta compatibilidad con "middleware", un concepto muy importante en el mundo de Cloud Computing y que facilita y agiliza el desarrollo de aplicaciones.


Aprovechando esa funcionalidad podemos realizar gran variendad de cosas en nuestra API de una forma mucho más sencilla como pueden ser autentificaciones ( con Rack::Auth::Basic ) o en nuestro caso, un fichero de log en el que se almacena información sobre todas las peticiones que se han intentado realizar al servidor.


Se puede realizar de una forma muy sencilla: 

~~~
  configure :production do
    log = ::Logger.new(File.join(File.dirname(File.expand_path(__FILE__)),'.','log','info.log'))
    use ::Rack::CommonLogger, log
  end

~~~

Simplemente definimos una variable con la ruta en la que queremos que se almacene la información y hacemos uso de ´::Rack::CommonLogger´ que registra en una línea cada solucion dada a la aplicación.

Destacar que este fragmento se ejecuta una única vez al iniciar el servidor y solo si está en modo de producción.

Puedes consultar info sobre ::Rack::CommonLogger [aquí](https://www.rubydoc.info/gems/rack/Rack/CommonLogger)

Ahora, se almacenarán todas las peticiones que se vayan realizando al servicio, puedes consultar dicho fichero de log [aquí](https://github.com/mariasanzs/makeupIV/tree/master/sinatra/log/info.log)

Cabe destacar que no solo podemos usar middleware de funciones predefinidas si no que podemos crear nuestras propias funcionalidades. 


