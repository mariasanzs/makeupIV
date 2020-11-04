# MakeUpIV 💄

API para obterner avisos en descuentos de maquillaje. Asignatura Infraestructura Virtual (IV) , ETSIIT, UGR.

La idea del proyecto es poder enterarse rápidamente de descuentos, promociones o ofertas rápidas de productos de maquillaje de tiendas Sephora, la cual muchas veces lanza gangas a través de sus redes sociales y demás medios que acaban agotándose de inmediato.

## Integración Continua 🟡➡✔ 

La integración garantiza que los cambios se creen y prueben con la última versión de todo el código base con el fin de encontrar errores lo antes posible y asegurar la calidad del código.

Para configurar la integración continua (CI) disponemos de dos plataformas online, Travis y Shippable.
  - Puedes consultar la documentación y justificación de Travis [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/travis.md)
  - Puedes consultar la documentación y justificación de Shippable [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/shippable.md)

## Enlaces a ficheros 📑
***🆕 .travis.yml***

Puedes consultar el fichero .travis.yml [aqui](https://github.com/mariasanzs/makeupIV/blob/master/.travis.yml)

***🆕 Shippable.yml***

Puedes consultar el fichero shippable.yml [aqui](https://github.com/mariasanzs/makeupIV/blob/master/shippable.yml)

***Dockerfile***

Puedes consultar el fichero Dockerfile [aqui](https://github.com/mariasanzs/makeupIV/blob/master/Dockerfile)

También puedes consultar la documentación del dockerfile y la justificación de las ordenes [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/dockerfile.md)

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

## Ejecutar test con Docker :whale:
Para ejecutar los test necesitamos tener clonado el respositorio de GitHub y además tener descargado en nuestro repositorio local el contenedor base.

Podemos encontrar el contenedor base tanto en DockerHub como en GitHub Container Registry.

Para descargar desde Docker Hub:
>docker pull mariasanzs/makeupiv

Para descargar desde GitHub Container Registry:
>docker pull ghcr.io/mariasanzs/makeupiv/packagemakeupiv:latest

Para ejecutar los test desde la carpeta del repositorio se hace:
>docker run -t -v `pwd`:/test mariasanzs/makeupiv

## Elección del contenedor base

Puedes consultar información sobre la comparación de diferentes imágenes y la optimización del tamaño y/o la velocidad del contenedor resultante [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/comparacionImagenes.md)

Puedes consultar la justificación del contenedor base [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/justificacionContenedor.md)

## Repositorios de contenedores de Docker :whale:
### ▪️Docker Hub

Puedes consultar la documentación sobre Docker Hub [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/dockerHub.md)

Puedes acceder al contenedor en Docker Hub en este [enlace](https://hub.docker.com/repository/docker/mariasanzs/makeupiv)

### ▪️Github Container Registry

Puedes consultar la documentación sobre Github Container Registry [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/githubContainerRegistry.md)

Puedes acceder al paquete de Github Container Registry en este [enlace](https://github.com/users/mariasanzs/packages/container/package/makeupiv%2Fpackagemakeupiv)

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



## Historias de Usuario
Puedes consultar las historias de usuario en la sección "Issues" bajo el label [user-stories](https://github.com/mariasanzs/makeupIV/issues?q=is%3Aopen+is%3Aissue+label%3Auser-stories)

## Issues
Puedes consultar los issues cerrados que se han ido cumpliendo [aquí](https://github.com/mariasanzs/makeupIV/issues?q=is%3Aissue+is%3Aclosed)

## Milestones
Enlace a los [Milestones](https://github.com/mariasanzs/makeupIV/milestones) del proyecto

## Pasos en el desarrollo
Puedes seguir los pasos llevados a cabo durante el proyecto en el siguiente [enlace](https://github.com/mariasanzs/makeupIV/blob/master/docs/pasos.md)

## Documentación 📖
[Configuración de git](https://github.com/mariasanzs/makeupIV/blob/master/docs/git.md) correctamente incluyendo el archivo config y las claves pública y privada]

## Autora ✒️
* **María Sanz Sánchez** - [mariasanzs](https://github.com/mariasanzs)
