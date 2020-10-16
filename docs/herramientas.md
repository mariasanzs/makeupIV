# Herramientas y servicios que se comprenden en el microservicio

## Lenguaje
El lenguaje que se usará para el proyecto es Ruby, del cual tengo una breve experiencia en otras asignaturas. Por otro lado Ruby soporta las principales bases de datos como PostgreSQL, MySQL o SQLiteentre las que barajo como posibles elecciones para mi proyecto. Además tiene una comunidad muy activa, tiene muy buena documentación y es muy recomendable para crear servicios REST.

## Gestor de versiones
A la hora de elegir un gestor de versiones se barajó elegir entre dos manejadores muy populares, RVM y rbenv. Finalmente ha sido elegido este último debido principalmente a que hoy en día tiene mucha más popularidad además de que resulta más simple que RVM a pesar de que los dos cumplen la misma función.

Rbenv permite especificar versiones de Ruby especificas de la aplicación además de cambiar las versiones globales de Ruby o anular versiones. Entre otras ventajas de rbenv también cabe destacar que no necesita de cambios en las bibliotecas de Ruby por compatibilidad ni hace falta ningún tipo de configuración excepto la de la versión de Ruby.
Debido a que rbenv no gestiona los conjuntos de gemas (gemsets) por defecto, se recomienda el uso de Bundler.

## Herramienta de testeo
Como programa para la realización de pruebas del código se ha elegido [Rspec](https://github.com/rspec/rspec), que está escrito en lenguaje Ruby. Esta herramienta para TDD ha sido elegida porque tiene una sintaxis relativamente simple lo que la hace muy popular.

->Sintaxis de [Rspec](https://www.tutorialspoint.com/rspec/rspec_basic_syntax.htm)

Una de las ventajas que lleva a escoger RSpec son las descripciones acerca de los resultados de la ejecución del test. En caso de que al comparar un resultado el test salga fallido, RSpec proporciona buena información sobre el fallo.
Otras herramientas alternativas que se podrían considerar son MiniTest o Cucumber con los cuales Rspec se puede combinar.

## Gestor de tareas
Se ha elegido [Rake](https://github.com/ruby/rake) como herramienta para la gestión de las tareas. Permite tanto especificar tareas como describir dependencias. Rake presenta muchas similitudes con Make (con el cual tengo experiencia), sin embargo está implementado en Ruby y por ello sus archivos Rakefiles están definidos por su sintaxis.

Rake permite la ejecución paralela de tareas o que sus usuarios puedan espeficar requisitos previos en dentro de las propias, lo que hace que pueda ser muy poderoso, permitiendo relacionar tareas entre sí o construir tareas a partir de otras. 

Además Rake dispone de bibliotecas de Ruby que pueden facilitar la creación de Rakefiles.

## Gestor de dependencias
Como manejador de dependencias he decidido usar [Bundler](https://github.com/rubygems/bundler). Dicho manejador permite gestionar e instalar gemas en nuestro proyecto de forma automática a partir de un fichero [Gemfile](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile).

Por otro lado, este gestor se encarga de asegurar la compatibilidad entre gemas cuando se añade una nueva y de actualizarlas en caso de haber nuevas versiones disponibles. También hace un registro de las versiones que se han instalado para que otros usuarios puedan instalar esas mismas gemas.

Bundler es considerada una herramienta que permite una buena práctica en el desarrollo de proyectos en Ruby por ello la mayoría de aplicaciones lo usan.

## Próximas herramientas
 Conforme se avance en el proyecto se añadirán nuevas herramientas tales como bases de datos, servidores de mensajería, sistema de ficheros especifico, sistemas de log...)
