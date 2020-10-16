# Pasos seguidos durante el desarrollo del proyecto

## Hito 1 - Esctructura general del proyecto
- Investigación y determinación de las herramientas que se van a usar
- Incorporar esas herramientas en el archivo [herramientas.md](https://github.com/mariasanzs/makeupIV/blob/master/docs/herramientas.md) dentro de la carpeta [docs](https://github.com/mariasanzs/makeupIV/tree/master/docs)
- Creación de Milestones correspondientes a cada hito
- Creación de los [issues](https://github.com/mariasanzs/makeupIV/issues) (Tareas) y de Historias de Usuario referenciadas mediante el label user-stories.
- Creación de la carpeta src/ en la que estarán incluidos todos los ficheros .rb
- Crear una primera clase para el proyecto
- Creación de un archivo [iv.yaml](https://github.com/mariasanzs/makeupIV/blob/master/iv.yaml)
- Mejora y actualización del fichero [README.md](https://github.com/mariasanzs/makeupIV#readme)

## Hito 2 - Test

- Instalación un gestor de versiones, en mi caso RBENV.
- Instalación Rspec para usarlo como herramienta BDD y poder testear nuestros programas.
- Creación de nuevos [Issues](https://github.com/mariasanzs/makeupIV/milestone/2) correspondientes al hito 2.
- Implementación código fuente correspondiente a las [HU](https://github.com/mariasanzs/makeupIV/issues?q=is%3Aopen+is%3Aissue+label%3Auser-stories) (Historias de usuario).
- Creación y modificación de métodos y/o funcionalidades dentro del [código fuente](https://github.com/mariasanzs/makeupIV/blob/master/src/makeup.rb), incluidas las excepciones. Para aprender sobre la implementación de excepciones consulté enlaces como [este](http://rubylearning.com/satishtalim/ruby_exceptions.html).
- Creación de la carpeta [spec/](https://github.com/mariasanzs/makeupIV/tree/master/spec) en la que estarán incluidos los test del proyecto.
- Implementación de test unitarios y significativos para cada una de las funciones de la clase en el fichero y de sus excepciones [testMakeUpIV.rb](https://github.com/mariasanzs/makeupIV/blob/master/spec/testMakeUpIV.rb) dentro de la carpeta [/spec](https://github.com/mariasanzs/makeupIV/tree/master/spec).
    -_Inciso: En realidad lo que se debería de hacer es primero realizar los test y a raíz de ellos implementar nuestro código._
- Instalar Bundler para la gestión de las dependencias y añadir los ficheros [Gemfile](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile) y [Gemfile.lock](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile.lock) generados.
- Con Rake, crear un fichero [Rakefile](https://github.com/mariasanzs/makeupIV/blob/master/Rakefile) para automatizar las tareas.
- Actualización del archivo [iv.yaml](https://github.com/mariasanzs/makeupIV/blob/master/iv.yaml).
- Actualización del fichero [herramientas.md](https://github.com/mariasanzs/makeupIV/blob/master/docs/herramientas.md) incluyendo las nuevas herramientas que se han utilizado en este hito.
- Mejora y actualización del fichero [README.md](https://github.com/mariasanzs/makeupIV#readme).
