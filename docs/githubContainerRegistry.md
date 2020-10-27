# GHCR - GitHub Container Registry

Se ha usado GitHub Container Registry como una herramienta alternativa a Docker Hub, que también permite alojar y administrar imágenes de contenedores de Docker.

***Cómo subir el contenedor a GHCR***

Creamos una nueva imagen con docker build -t y copiamos el ID de la nueva imagen haciendo $docker images.

Una vez la tenemos, debemos de etiquetarla con:

>docker tag 4fcab233e9a3  docker.pkg.github.com/mariasanzs/packagemakeupiv:latest

Por otro lado debemos de crear un token para el registro del contenedor, eso lo encontramos en los ajustes, en la sección 'personal access token', que nos generará el PAT que nos permitirá autenticarnos.

>Export DOCKER-TOKEN = 'valor del token que se haya dado'

>echo $DOCKER-TOKEN | docker login https://docker.pkg.github.com -u mariasanzs --password-stdin

Tras esto, subimos haciendo 'push' nuestra imagen a GitHub Container Registry:

>docker push docker.pkg.github.com/mariasanzs/makeupiv/packagemakeupiv:latest

Para terminar, nos vamos a la sección 'Packages' dentro de nuestro perfil de GitHub, aparecerá el paquete que acabamos de crear. Deberemos ponerlo con visibilidad pública en los ajustes del paquete y además enlazarlo a nuestro repositorio.

***Paquete disponible de la imagen en nuestro repositorio***

Puedes acceder al paquete [aquí](https://github.com/users/mariasanzs/packages/container/package/makeupiv%2Fpackagemakeupiv)
