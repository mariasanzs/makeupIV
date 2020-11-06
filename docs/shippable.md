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
  - 2.5.0
  - 2.4.0
~~~

- Realizamos la "construcción" dentro de la siguiente sección en la que primero instalamos las dependencias y luego llamamos al task runner para ejecutar rake test 
~~~
build:
  ci:
    - bundle install
    - rake test
~~~

## Resultados construcción y test

Con respecto al tiempo de contrucción que conlleva realizar el test, es claramente superior al que se necesita con Travis, esto es debido a que Shippable va recorriendo las compilaciones una a una y no de forma paralela como si que sucede en TravisCI

![buildShippable](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/buildshippable.png)

Podemos ver un registro en consola de todos los pasos que se han llevado a cabo y del tiempo que ha conllevado cada uno de ellos:

![consola](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/registroConsolaShippable.png)

## ¿Cómo he puesto en marcha Shippable?

Darse de alta en Shippable es muy sencillo, simplemente debes de ir a la web y entrar usando tu cuenta de github

![signup](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/shippable.png)

Tras esto simplemente deberemos de autorizar a Shippable para tener acceso a nuestra cuenta 

![accessAuthorize](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/Authorize%20prod-shippable.png)

Así ya podremos acceder al repositorio y a los resultados de las construcciones y test que se le realicen a este








