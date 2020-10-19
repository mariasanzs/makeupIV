# RBENV - Gestor de versiones

A la hora de elegir un gestor de versiones se barajó elegir entre dos manejadores muy populares, [RVM](https://github.com/rvm/rvm) y [RBENV](https://github.com/rbenv/rbenv).

Finalmente ha sido elegido este último debido principalmente a que hoy en día tiene mucha más popularidad además de que resulta más simple que RVM a pesar de que los dos cumplen la misma función.

Rbenv permite especificar versiones de Ruby especificas de la aplicación además de cambiar las versiones globales de Ruby o anular versiones. Entre otras ventajas de Rbenv también cabe destacar que no necesita de cambios en las bibliotecas de Ruby por compatibilidad ni hace falta ningún tipo de configuración excepto la de la versión de Ruby.

Debido a que Rbenv no gestiona los conjuntos de gemas (gemsets) por defecto, se recomienda el uso de [Bundler](https://github.com/mariasanzs/makeupIV/blob/master/docs/bundler.md).

***Instalación de RBENV***
En el siguiente [enlace](https://github.com/rbenv/rbenv#basic-github-checkout) se explican los pasos que hay que seguir para instalar RBENV de forma manual
