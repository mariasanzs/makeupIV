# Justificación del contenedor base elegido

* Elección de 2.7.2-alpine

Tras haber realizado comparaciones entre diferentes imágenes oficiales de Ruby, disponibles [aquí](https://github.com/mariasanzs/makeupIV/blob/master/docs/comparacionImagenes.md#comparaci%C3%B3n-entre-diferentes-im%C3%A1genes-base), los resultados han demostrado que la mejor de las variantes de imágenes es la versión 2.7.2-alpine, ya que ofrece un tamaño mucho más pequeño que el resto de las imágenes (69.3 MB) y además consigue el menos de los tiempo de ejecución (0m5,714s)

Si bien es cierto que puede producir ciertos porblemas en algunos software debido a requisitos de libc, para el caso de nuestro proyecto no desarrolla ningún tipo de inconveniente.

Otro dato importante sobre Alpine es que las imágenes base que se generan usan como base Alpine Linux que destaca por ser una distribución minimalista, por ello para minimizar el tamaño de la imagen se dejan de incluir herramientas relacionadas adicionales como pueden ser git o bash
