# Explicación del fichero Handler.rb

Puedes acceder a dicho fichero [aquí](https://github.com/mariasanzs/makeupIV/blob/master/makeup-iv-bot/handler.rb)

### Contenido del fichero 

Dentro del fichero tenemos varias funciones auxiliares que simplemente comentaremos, al ser muy extenso el fichero.
- La función leerDatos(tipo), simplemente es llamada para obtener del fichero json correspondiente los datos acerca de [clientes](https://github.com/mariasanzs/makeupIV/blob/master/makeup-iv-bot/datosClientes.json) o [productos](https://github.com/mariasanzs/makeupIV/blob/master/makeup-iv-bot/datosProducto.json) respectivamente para cada fichero.

- La función datosCliente(correo) corresponde al [HU07](https://github.com/mariasanzs/makeupIV/issues/45) y devuelve una cadena con información ( si se ha encontrado ) de un cliente.

- La función datosProducto(nombre) corresponde al [HU02](https://github.com/mariasanzs/makeupIV/issues/10) y devuelve una cadena con información ( si se ha encontrado ) de un producto.

Por último tenemos la función principal que se encarga de recibir los datos del bot y procesar una respuesta. En ella obtenemos los datos a partir del evento que se produce y se genera una cadena de respuesta en función del mensaje que haya sido recibido, tras eso, el mensaje es devuelto con un código de estado 200 ( todo está bien) y un body (payload) con la información pertinente.
~~~

def datospersonales(event:, context:)
    begin
      data = JSON.parse(event["body"])
      message = data["message"]["text"]
      chat_id = data["message"]["chat"]["id"]
      first_name = data["message"]["chat"]["first_name"]

      response = "Hola #{first_name}!, Bienvenido a MakeupIV-bot \n"
      response += " Si quieres ver los datos de un cliente haz '/misdatos <correo>'\n"
      response += " Si quieres ver los datos de un producto haz '/listaproducto <correo>'\n "

      command = message.split(" ")[0]

      if command == '/misdatos'
        response = datosCliente(message.split(" ")[1])
      end
      if command == '/listaproducto'
        command += " "
        response = datosProducto(message.split(command).last)
      end

      payload = {text:response, method:'sendMessage', chat_id:chat_id}

    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
    end

    return {
      statusCode: 200,
      body: payload.to_json,
      headers: {
          'Content-Type': 'application/json'
      }
    }
end

~~~
