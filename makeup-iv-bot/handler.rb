require 'json'
require 'net/https'

def leerDatos(tipo)
  if tipo == "cliente"
      archivo = File.dirname(__FILE__),'datosClientes.json'
  else
      archivo = File.dirname(__FILE__),'datosProducto.json'
  end
  archivo = File.join(archivo)
  archivo = File.read(archivo)
  vector = JSON.parse(archivo)
  return vector
end

def datosCliente(correo)
  clientes = leerDatos("cliente")
  cad = 'Usuario no encontrado'
  for i in (0..clientes["clientes"].length-1)
    if clientes["clientes"][i]["correo"] == correo
      cad = " Mis Datos Personales:
      Nombre: #{clientes["clientes"][i]["nombre"]}
      Apellidos: #{clientes["clientes"][i]["apellidos"]}
      Correo Electrónico: #{correo}
      Código Postal: #{clientes["clientes"][i]["codigoPostal"]}
      Fecha de Nacimiento: #{clientes["clientes"][i]["FechaNacimiento"]} \n"
    end
  end
  return cad
end

def datosProducto(nombre)
  productos = leerDatos("producto")
  cad = 'Producto no encontrado'
  for i in (0..productos["productos"].length-1)
    if productos["productos"][i]["nombre"] == nombre.to_s
      cad = " Detalles del producto:
    Nombre: #{productos["productos"][i]["nombre"]}
    Tipo: #{productos["productos"][i]["tipo"]}
    Tonos: #{productos["productos"][i]["tonos"]}
    Precio: #{productos["productos"][i]["precio"]}
    Precio Rebajado: #{productos["productos"][i]["precioRebajado"]}\n"
    end
  end
  return cad
end

def datospersonales(event:, context:)
    begin
      data = JSON.parse(event["body"])
      message = data["message"]["text"]
      chat_id = data["message"]["chat"]["id"]
      first_name = data["message"]["chat"]["first_name"]

      response = "Hola #{first_name}!, Bienvenido a MakeupIV-bot \n"
      responde += " **Comandos**\n"
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
