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
