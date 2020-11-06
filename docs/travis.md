## Justificación TravisCI

Puedes acceder al fichero [aquí](https://github.com/mariasanzs/makeupIV/blob/master/.travis.yml)

Y a mi perfil de travis [aquí](https://travis-ci.com/github/mariasanzs)

Para darse de alta en una cuenta en travis seguí los pasos y los documenté en el repositorio de ejercicios, puedes acceder a esos pasos [aquí](https://github.com/mariasanzs/EjerciciosIV/blob/master/hito4/ejer9.md)

## Explicación del fichero .travis.yml

- Indicamos como lenguaje que vamos a usar minimal, lo que nos va a permitir que travis se ejecuté más rápido y necesite más espacio de disco ya que evitará instalar cualquier cosa referente al lenguaje y que nosotros no necesitaremos al hacer uso de nuestro contenedor de docker
~~~
language: 
  - minimal
~~~

- Construimos nuestro contenedor de docker descargándolo desde Docker Hub. De esta forma aprovechamos el contenedor que habíamos generado en el hito anterior.
~~~
install:
  - docker pull mariasanzs/makeupiv
  - docker images
~~~

- Se ejecutan los test desde la carpeta del contenedor para verificar que todo funciona correctamente.
~~~
script:
  - docker run -t -v `pwd`:/test mariasanzs/makeupiv:latest
~~~

## Comprobando el funcionamiento de TravisCI



De todas formas también puedes ver ese mismo build [aquí](https://travis-ci.com/github/mariasanzs/makeupIV/builds/198622059)


