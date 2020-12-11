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

## Hito3 - Creación de un contenedor para pruebas

- Creación de un fichero [Dockerfile](https://github.com/mariasanzs/makeupIV/blob/master/Dockerfile) para poder generar contenedores para los test
- Creación de una cuenta en [Docker Hub](https://hub.docker.com/u/mariasanzs) y subir en dicha cuenta el [contenedor](https://hub.docker.com/r/mariasanzs/makeupiv)
- Puesta en Github Container Registry del [contenedor base](https://github.com/users/mariasanzs/packages/container/package/makeupiv%2Fpackagemakeupiv).
- Añadir la nueva documentación sobre todos los conceptos desarrollados en el hito. Disponible en la carpeta [/docs](https://github.com/mariasanzs/makeupIV/tree/master/docs)
- Mejora y actualización del fichero [README.md](https://github.com/mariasanzs/makeupIV#readme).

## Hito4 - Integración Continua

- Realizar los ejercicios de autoevaluación
- Creación y configuración de una cuenta en [Travis](https://github.com/mariasanzs/makeupIV/blob/master/docs/travis.md) para realizar test de integración Continua
- Creación y configuración de una cuenta en [Shippable](https://github.com/mariasanzs/makeupIV/blob/master/docs/shippable.md) para realizar test de CI
- Añadir la nueva documentación sobre todos los conceptos desarrollados en el hito, como puede ser la justificación de la plataforma, el uso del task runner o el aprovechamiento del dockerfile. Disponible en la carpeta [/docs](https://github.com/mariasanzs/makeupIV/tree/master/docs)
- Avanzar y mejorar el código reflejado en las [user-stories](https://github.com/mariasanzs/makeupIV/issues?q=is%3Aopen+is%3Aissue+label%3Auser-stories)
- Mejora y actualización del fichero [README.md](https://github.com/mariasanzs/makeupIV#readme).

## Hito5 - Serverless

- Realizar los ejercicios de autoevaluación
- Creación y configuración de una cuenta en [Vercel](https://github.com/mariasanzs/makeupIV/blob/master/docs/despliegueVercel.md) 
- Desarrollo de una función con sus respectivos HU e ISSUES con Vercel
- Desarrollo de un bot de Telegram con [AWS lambda](https://github.com/mariasanzs/makeupIV/blob/master/docs/lambda.md)
- Añadir la nueva documentación sobre todos los conceptos desarrollados en el hito, como puede ser la conexión entre el repositorio y Vercel o el uso de AWS. Disponible en la carpeta [/docs](https://github.com/mariasanzs/makeupIV/tree/master/docs)
- Mejora y actualización del fichero [README.md](https://github.com/mariasanzs/makeupIV#readme).

## Hito6 - Microservicios

- Realizar los ejercicios de [autoevaluación](https://github.com/mariasanzs/EjerciciosIV/blob/master/hito6/autoevaluacionHito6.md#enlaces-a-los-ejercicios)
- Diseñar a modo general la API con sus respectivas rutas y tipos devueltos por las peticiones que correspondan con HU
- Desarrollo de test de acuerdo a las HU
- Crear un fichero de log haciendo uso de un middleware
- Añadir la nueva documentación sobre todos los conceptos desarrollados en el hito. Disponible en la carpeta [/docs](https://github.com/mariasanzs/makeupIV/tree/master/docs)
- Mejora y actualización del fichero [README.md](https://github.com/mariasanzs/makeupIV#readme).
