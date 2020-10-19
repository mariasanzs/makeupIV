# Rake - Herramienta de Construcción

Se ha elegido [Rake](https://github.com/ruby/rake) como herramienta para la gestión de las tareas. Permite tanto especificar tareas como describir dependencias. Rake presenta muchas similitudes con Make (con el cual tengo experiencia y me motiva a elegirlo), sin embargo está implementado en Ruby y por ello sus archivos Rakefiles están definidos por su sintaxis.

Rake permite la ejecución paralela de tareas o que sus usuarios puedan espeficar requisitos previos en dentro de las propias, lo que hace que pueda ser muy poderoso, permitiendo relacionar tareas entre sí o construir tareas a partir de otras.

Además Rake dispone de bibliotecas de Ruby que pueden facilitar la creación de Rakefiles.

***Uso de Rake***

Rakefile nos va a permitir tanto ejecutar los test como instalar las dependencias necesarias en nuestro proyecto, y antes de ponerlo en marcha deberíamos instalar [Bundler](https://github.com/mariasanzs/makeupIV/blob/master/docs/bundler.md)

**Comandos con Rake:**
* Para ver una descripción de las acciones que podemos realizar
>rake --task

o

>rake -T

* Para instalar las dependencias con Bundler
>rake -installdeps

* Para ejecutar el test
>rake test

Por otro lado, configurar el fichero [Rakefile](https://github.com/mariasanzs/makeupIV/blob/master/Rakefile) es muy sencillo, en él se van definiendo "task", en nuestro caso
_installdeps_ y _test_ que ejecutan lo especificado en la tarea.

Para el caso de install deps se hace "bundle install" para lanzar la insercción/actualización de las herramientas, y para el caso de test se hace
 "rspec ./spec/testMakeUpIV.rb" para ejecutar con Rspec nuestro fichero de test
