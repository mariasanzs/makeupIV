# Docker Hub

Docker Hub es un repositorio público en la nube que nos permite subir nuestros contenedores Docker.

Para usarlo primeramente hemos debido de crearnos una [cuenta](https://hub.docker.com/u/mariasanzs) cuyo nick del usuario coincide con el nick de GitHub.

Tras esto debemos de crear un repositorio con nombre igual al de nuestro proyecto de GitHub y los enlazaremos entre sí.

Debemos de configurar las herramientas de construcción automática para que se actualice de forma autómatica nuestro repositorio en Docker Hub cuando realicemos cambios en el repositorio de GitHub, estas ocpiones las encontraremos en la sección Automated Builds dentro del apartado [Builds](https://hub.docker.com/repository/docker/mariasanzs/makeupiv/builds) del repositorio

Una vez tengamos todas las configuraciones realizadas podremos ver que el build ha funcionado con éxito y que aparece nuestro README.md actualizado

*** Descargar contenedor de Docker Hub ***
> docker pull mariasanzs/makeupiv
