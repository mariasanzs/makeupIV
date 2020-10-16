# MakeUpIV 💄

API para obterner avisos en descuentos de maquillaje. Asignatura Infraestructura Virtual (IV) , ETSIIT, UGR.

La idea del proyecto es poder enterarse rápidamente de descuentos, promociones o ofertas rápidas de productos de maquillaje de tiendas Sephora, la cual muchas veces lanza gangas a través de sus redes sociales y demás medios que acaban agotándose de inmediato.

## Herramientas 🛠️
Para conocer todas las herramientas de las que se hará uso durante el desarrollo de este código consulte [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/herramientas.md).

## Enlaces a ficheros

***Código fuente***

Puedes acceder al código fuente del proyecto desde la carpeta [/src](https://github.com/mariasanzs/makeupIV/tree/master/src)

***Ficheros de test***

Todos los test están localizados en la carpeta [/spec](https://github.com/mariasanzs/makeupIV/tree/master/spec)

***iv.yaml***

Puedes consultar el fichero iv.yaml [aqui](https://github.com/mariasanzs/makeupIV/blob/master/iv.yaml)

***Ficheros de dependencias***
Aquí se encuentran los ficheros [Gemfile](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile) y [Gemfile.lock](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile.lock). En Gemfile especificamos que gemas vamos a usar mientras que Gemfile.lock se encarga de mantener esas versiones actualizadas cuando corremos Bundler.

***Fichero de gestión de tareas***
Usando [Rakefile](https://github.com/mariasanzs/makeupIV/blob/master/Rakefile) podemos gestionar la tareas y automatizarlas.

Rakefile nos va a permitir tanto ejecutar los test como instalar las dependencias necesarias en nuestro proyecto, y antes de ponerlo en marcha deberíamos instalar Bundler (ambas herramientas están más descritas en el fichero de [herramientas](https://github.com/mariasanzs/makeupIV/blob/master/docs/herramientas.md)).

Para instalar Bundler:
>gem install bundler
>bundle init
>bundle add rspec
>bundle add rake
>bundle install
y ya se generan Gemfile y Gemfile.lock

*Comandos con Rake:
Para ver una descripción de las acciones que podemos realizar
>rake -T

Para instalar las dependencias con Bundler
>rake -installdeps

Para ejecutar el test
>rake test

## Historias de Usuario
Puedes consultar las historias de usuario en la sección "Issues" bajo el label [user-stories](https://github.com/mariasanzs/makeupIV/issues?q=is%3Aopen+is%3Aissue+label%3Auser-stories)

## Issues
Puedes consultar todas las tareas que se han ido cumpliendo [aquí](https://github.com/mariasanzs/makeupIV/issues?q=is%3Aissue+is%3Aclosed)

## Milestones
Enlace a los [Milestones](https://github.com/mariasanzs/makeupIV/milestones) del proyecto

## Pasos en el desarrollo
Puedes seguir los pasos llevados a cabo durante el proyecto en el siguiente [enlace](https://github.com/mariasanzs/makeupIV/blob/master/docs/pasos.md)

## Documentación 📖
[Configuración de git](https://github.com/mariasanzs/makeupIV/blob/master/docs/git.md) correctamente incluyendo el archivo config y las claves pública y privada]

## Autora ✒️
* **María Sanz Sánchez** - [mariasanzs](https://github.com/mariasanzs)
