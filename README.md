# MakeUpIV 💄

API para obterner avisos en descuentos de maquillaje. Asignatura Infraestructura Virtual (IV) , ETSIIT, UGR.

La idea del proyecto es poder enterarse rápidamente de descuentos, promociones o ofertas rápidas de productos de maquillaje de tiendas Sephora, la cual muchas veces lanza gangas a través de sus redes sociales y demás medios que acaban agotándose de inmediato.


## Herramientas 🛠️

### Lenguaje

Como lenguaje de programación se ha elegido [Ruby](https://github.com/mariasanzs/makeupIV/blob/master/docs/herramientas.md)

### Gestor de versiones

Se ha elegido RBENV como gestor de versiones, la justificación de la elección y demás información puedes consultarlo [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/rbenv.md#rbenv---gestor-de-versiones)

### Herramienta de testeo

Se utilizará Rspec como herramienta para testear todo nuestro código. Toda la información esta [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/rspec.md#rspec---marco-de-test) disponible

### Gestor de dependencias

Para gestionar las dependencias se usará Bundler, para conocer más sobre esta herramienta y su elección consulte el siguiente [enlace](https://github.com/mariasanzs/makeupIV/blob/master/docs/bundler.md)

### Herramienta de construcción

Como herramienta para automatizar y gestionar tareas se hace uso de Rake, toda la información relevante se encuentra [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/rake.md)



## Enlaces a ficheros 📑

***Código fuente***

Puedes acceder al código fuente del proyecto desde la carpeta [/src](https://github.com/mariasanzs/makeupIV/tree/master/src)

***Ficheros de test***

Todos los test están localizados en la carpeta [/spec](https://github.com/mariasanzs/makeupIV/tree/master/spec)

***iv.yaml***

Puedes consultar el fichero iv.yaml [aqui](https://github.com/mariasanzs/makeupIV/blob/master/iv.yaml)

***Ficheros de dependencias***

Aquí se encuentran los ficheros [Gemfile](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile) y [Gemfile.lock](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile.lock). En Gemfile especificamos que gemas vamos a usar mientras que Gemfile.lock se encarga de mantener esas versiones actualizadas cuando corremos [Bundler](https://github.com/mariasanzs/makeupIV/blob/master/docs/bundler.md#bundler---gestor-de-dependencias).

***Fichero de gestión de tareas***

Aquí se encuentra el fichero [Rakefile](https://github.com/mariasanzs/makeupIV/blob/master/Rakefile) con el que podemos gestionar la tareas y automatizarlas con [Rake](https://github.com/mariasanzs/makeupIV/blob/master/docs/rake.md)

## Haciendo uso de Rakefile 🔷

Antes de ejecutar el Rakefile deberíamos de tener instalado Bundler y Rake:

> gem install bundler

> gem install rake

### Para instalar las dependencias con Bundler: 🔹

Simplemente debemos de escribir el siguiente comando para instalar las dependencias:

>rake -installdeps


### Para realizar los test de nuestro código: 🔹

* Ejecutamos los test haciendo:
>rake test


## Historias de Usuario
Puedes consultar las historias de usuario en la sección "Issues" bajo el label [user-stories](https://github.com/mariasanzs/makeupIV/issues?q=is%3Aopen+is%3Aissue+label%3Auser-stories)

## Issues
Puedes consultar los issues cerrados en el hito 2 [aquí](https://github.com/mariasanzs/makeupIV/issues?q=is%3Aissue+is%3Aclosed+milestone%3A%22Hito+2+-+Test%22)

Y si quieres consultar todas las tareas que se han ido cumpliendo [aquí](https://github.com/mariasanzs/makeupIV/issues?q=is%3Aissue+is%3Aclosed)

## Milestones
Enlace a los [Milestones](https://github.com/mariasanzs/makeupIV/milestones) del proyecto

## Pasos en el desarrollo
Puedes seguir los pasos llevados a cabo durante el proyecto en el siguiente [enlace](https://github.com/mariasanzs/makeupIV/blob/master/docs/pasos.md)

## Documentación 📖
[Configuración de git](https://github.com/mariasanzs/makeupIV/blob/master/docs/git.md) correctamente incluyendo el archivo config y las claves pública y privada]

## Autora ✒️
* **María Sanz Sánchez** - [mariasanzs](https://github.com/mariasanzs)
