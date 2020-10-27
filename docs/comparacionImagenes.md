# Comparación entre diferentes imágenes base

Compararemos las diferentes imágenes oficiales que podemos encontrar para Ruby en cuestión de tamaño que ocupan y velocidad con la que consiguen ejecutar los test

Ruby tiene diferentes variantes de imagen nosotros compararemos las tres:
- ruby:2.7.2 que es la imagen por defecto
- ruby:2.7.2-slim que solo contiene los paquetes mínimos necesarios para ejecutar ruby
- ruby:2.7.2-alpine que es mucho más pequeño que la mayoría de imagenes 

Para comparar tamaños crearemos una imagen con cada versión y podemos comprobar de la siguiente forma los tamaños:

Como podemos ver 

Para comparar los tiempos de ejecución lanzaremos 

>docker run -t -v `pwd`:/test 'nombre version':latest

y ahí mismo nos muestra el tiempo que ha tardado.

Los resultado en tiempo son:


Por ser la que mejores resultados ha obtenido en relación tamaño del contenedor/velocidad de ejecución se ha elegido ruby:2.7.2-alpine como imagen base.

Puedes acceder desde [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/justificacionContenedor.md) a una justificación más extensa de la misma
