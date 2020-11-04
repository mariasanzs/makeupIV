# Otra versión del fichero .travis.yml 

Ahora mismo en nuestro repositorio tenemos un fichero .travis.yml (disponible [aquí](https://github.com/mariasanzs/makeupIV/blob/master/.travis.yml)) que construye y prueba el código del proyecto haciendo uso del contendedor de docker aprovechando el realizado en el hito 3.

Sin embargo, a modo de alternativa podemos crear también nuestro fichero .travis.yml como en el ejemplo expuesto abajo, en el que aparece de una forma más "básica",
especificando el lenguaje y la versión con la que trabajar de este, la instalación de Bundler para la realización de los test y por último la ejecución de los mismos. También especificamos que se almacene en caché el paquete entre compilaciones para reducir el tiempo de compilación.

~~~
language: ruby
cache: bundler

rvm:
  - 2.7.2

before-install:
  - gem install bundler
  - bundle install

script:
  - rake test
~~~

En enlace al build está disponible [aquí](https://travis-ci.com/github/mariasanzs/makeupIV/jobs/427522591/config), de todas formas puedes ver el resultado en la siguiente imagen:

![travisAlternativa](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/AlternativaTravis.png)
