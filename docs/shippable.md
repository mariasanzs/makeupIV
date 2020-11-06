## Justificación del fichero Shippable.yml

Puedes acceder al fichero shipable.yml [aquí](https://github.com/mariasanzs/makeupIV/blob/master/shippable.yml)

Shippable es uno de los programas más conocidos y usados para realizar CI a un repositorio de GitHub 

## Explicación del fichero

Para desarrollar el fichero seguí el siguiente [enlace](http://docs.shippable.com/ci/ruby-continuous-integration/)

- Añadimos el lenguaje en el que se trabaja:
`language: ruby`

- Para reducir el tiempo de compilación indicamos que se debe de almacenar en caché el paquete de bundler entre las compilaciones:
`cache: bundler`

- Indicamos las versiones con las que es compatible el proyecto:
~~~
rvm:
  - 2.7.2
~~~

- Realizamos la "construcción" dentro de la siguiente sección en la que primero instalamos las dependencias y luego llamamos al task runner para ejecutar rake test 
~~~
build:
  ci:
    - bundle install
    - rake test
~~~

## Resultados construcción y test


## ¿Qué nos ofrece Shippable?
