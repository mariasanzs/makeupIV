# Dockerfile

Puedes aceder a mi fichero Dockerfile [aquí](https://github.com/mariasanzs/makeupIV/blob/master/Dockerfile)

***Explicación de las órdenes ejecutas***

Comenzamos fijando la versión de la imagen base, es importante siempre fijar dicha versión. Puedes consultar las razones por las que he elegido ruby:2.7.2-alpine [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/justificacionContenedor.md)

> FROM ruby:2.7.2-alpine

Especificamos quién es el desarrollador del fichero

> LABEL version="1.0.0" maintainer="María Sanz Sánchez <mariasanz@correo.ugr.es>"

Evita errores en el caso de que se haya modificado el Gemfile desde el Gemfile.lock

> RUN bundle config --global frozen 1

Hay que evitar ejecutar nuestra aplicación como root ya que proporciona vulnerabilidad a la aplicación, por ello debemos de crear un usuario sin privilegios para que corra la apliación siempre y cuando sea posible. Usamos la opción -D para no tener que configurar todos los parámetros del usuario

> RUN adduser -D my-test-user

En GEM_HOME se instalan las gemas por defecto, dicho fichero lo cambiamos para que sea ejecutado con los privilegios del usuario que hemos creado y no con los del superusuario

> RUN chown my-test-user $GEM_HOME &&  chmod 777 $GEM_HOME

Accedemos al usuario para realizar la orden CMD

> USER my-test-user

Trabajamos en el directorio de mi usuario para copiar después los Gemfile

> WORKDIR /home/my-test-user

Para copiar los ficheros para poder instalar bundler usamos el usuario sin privilegios, para ello debemos de añadir antes la orden --chown

> COPY --chown=my-test-user Gemfile ./

> COPY --chown=my-test-user Gemfile.lock ./

Construimos la aplicación

> RUN bundle install

Borramos los ficheros de instalación:

> RUN rm -r /home/my-test-user/Gemfile*

Trabajamos en el directorio test para ejecutar el Rakefile

> WORKDIR /test

En el siguiente comando se especifica cual es la orden que se desea correr, es importante expresarla en formato exec y no en formato shell, ya que es la forma recomendada y asegura que el proceso se ejecutará como PID 1

> CMD ["rake", "test"]


## Buenas prácticas en el desarrollo del Dockerfile

Para conocer cuales son las buenas prácticas durante el desarrollo del Dockerfile, uno de los enlaces que me fueron más útiles es el [siguiente](https://lipanski.com/posts/dockerfile-ruby-best-practices)

Las buenas prácticas permiten optimizar tanto la calidad del código como la velocidad de ejecución o el tamaño de la imagen.

Aunque ya se han mencionado en el apartado anterior todas las órdenes y la justificación del uso de cada una, aquí se lista una serie de optimizaciones que se han realizado:

* Se ha hecho uso de una imagen base minimizada y oficial
* Solo se hace copia de lo justo y necesario, y una vez es usada se elimina para reducir el tamaño.
* Se hace uso de múltiples líneas con RUN para reducir el número de capas
* Se evita el uso de root en la aplicación para evitar vulnerabilidad en la aplicación.
* Se han colocado los comandos con menos probabilidad de que sean cambiados en la parte superior ya que Docker cuando detecta los cambios reconstruye todos los pasos desde el cambio

### Optimización tras la construcción

Existen opciones para docker build que permiten una optimización de nuestra imagen tales son como --squash o --compress que reducen el tamaño de la imagen al minimizar el número de capas.

Hay que tener en cuenta cuando se hace uso de estas opciones que es necesario tener habilitado el modo experimental dentro de la configuración de docker ya que son relativamente nuevas.

En el siguiente [enlace](https://docs.docker.com/engine/reference/commandline/build/) por ejemplo, se especifican los pasos que se han de seguir para usar squash.

Por otro lado, tras hacer 

> docker history 'id de la imagen' 

se puede comprobar cuando espacio ocupa cada línea del archivo dockerfile que se ejecuta

Aquí se muestra el antes y el después de ejecutar con 

> docker build --squash -t ejemplo:latest .

***antes***

***después***

Como se puede observar , todas las capas se han mergeado aunque el espacio que ocupa la imagen sigue siendo el mismo
