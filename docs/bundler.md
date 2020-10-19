# Bundler - Gestor de dependencias

Como manejador de dependencias he decidido usar [Bundler](https://github.com/rubygems/bundler). Dicho manejador permite gestionar e instalar gemas en nuestro proyecto de forma automática a partir de un fichero [Gemfile](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile).

***¿ Por qué se ha elegido Bundler ?***
Este gestor se encarga de asegurar la compatibilidad entre gemas cuando se añade una nueva y de actualizarlas en caso de haber nuevas versiones disponibles. También hace un registro de las versiones que se han instalado para que otros usuarios puedan instalar esas mismas gemas.

Bundler es considerada una herramienta que permite una buena práctica en el desarrollo de proyectos en Ruby por ello la mayoría de aplicaciones lo usan.

***Instalación de Bundler***

Para instalar Bundler:
>gem install bundler

>bundle init

>bundle add rspec

>bundle add rake

>bundle install

y ya se generan [Gemfile](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile) y [Gemfile.lock](https://github.com/mariasanzs/makeupIV/blob/master/Gemfile.lock)
