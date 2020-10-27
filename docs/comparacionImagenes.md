# Comparación entre diferentes imágenes base

Compararemos las diferentes imágenes oficiales que podemos encontrar para Ruby en cuestión de tamaño que ocupan y velocidad con la que consiguen ejecutar los test

Ruby tiene diferentes variantes de imagen nosotros compararemos las tres:
- ruby:2.7.2 que es la imagen por defecto
- ruby:2.7.2-slim que solo contiene los paquetes mínimos necesarios para ejecutar ruby
- ruby:2.7.2-alpine que es mucho más pequeño que la mayoría de imagenes 

Podemos encontrar muchas más etiquetas compatibles con Dockerfile [aquí](https://hub.docker.com/_/ruby)

***Comparación respecto al tamaño***

Para comparar tamaños crearemos una imagen con cada versión y podemos comprobar de la siguiente forma los tamaños:

![tamaños](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/tamano.png)

Como podemos ver la versión por defecto es 7 veces más grande que la de Slim, y 12 veces más grande que la de Alpine. Además Alpine es la que menos espacio ocupa (69.3MB)

***Comparación respecto al tiempo de ejecución ***
Para comparar los tiempos de ejecución lanzaremos:

>docker run -t -v `pwd`:/test 'nombre version':latest

y ahí mismo nos muestra el tiempo que ha tardado.

Los resultado en tiempo son:

* ruby:2.7.2 --- 5,776 seconds

![time defecto](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/timedefecto.png)

![defecto tiempo](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/imagenDefecto.png)

* ruby:2.7.2-slim --- 5,807 seconds

![time slim](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/timeslim.png)

![slim tiempo](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/imagenSlim.png)

* ruby:2.7.2-alpine --- 5,714 seconds

![time alpine](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/timealpine.png)

![Alpine tiempo](https://github.com/mariasanzs/makeupIV/blob/master/docs/img/ImagenAlpine.png)

Por lo tanto la imagen que ejecuta los test a más velocidad es alpine seguida de la imagen por defecto y por último slim.

Por ser la que mejores resultados ha obtenido en relación tamaño del contenedor/velocidad de ejecución se ha elegido ruby:2.7.2-alpine como imagen base.

Puedes acceder desde [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/justificacionContenedor.md) a una justificación más extensa de la misma
