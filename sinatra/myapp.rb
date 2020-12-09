# myapp.rb

require 'sinatra'
require 'json'

require_relative '../src/almacen.rb'
require_relative '../src/compra.rb'
class MyApp < Sinatra::Base

  before do
    @almacen = Almacen.new
  end

  get '/' do
    {:status => 'ok'}.to_json
  end

  get '/disponibilidad/:producto' do
    content_type :json
    nombreproducto = params['producto'].to_s
    res = @almacen.buscarProducto(nombreproducto).consultarUnidadesDisponibles()
    if res.nil?
      status 400
      {:status => 'Error: no se encontró nada de este producto'}.to_json
    else
      res.to_json
    end
  end

  get '/caracteristicas/:producto' do
    content_type :json
    nombreproducto = params['producto']
    res = @almacen.buscarProducto(nombreproducto).listarCaracteristicasProducto()
    if res.nil?
      status 400
      {:status => 'Error: no se encontró nada de este producto'}.to_json
    else
      res.to_json
    end
  end

  error 404 do
    content_type :json
    {:status => 'Error: ruta no encontrada'}.to_json
  end
end
