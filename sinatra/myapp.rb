# myapp.rb

require 'sinatra'
require 'json'

require_relative '../src/almacen.rb'
require_relative '../src/compra.rb'
class MyApp < Sinatra::Base

  get '/' do
    {:status => 'ok'}.to_json
  end

  get '/disponibilidad/:producto' do
    content_type :json
    nombreproducto = params['producto'].to_s
    begin
      res = @@almacen.buscarProducto(nombreproducto).consultarUnidadesDisponibles()
      status 200
      {:unidadesDisponibles => res}.to_json
    rescue StandardError
      status 400
      {:status => 'Error: no hay disponibilidad de este producto'}.to_json
    end
  end

  get '/caracteristicas/:producto' do
    content_type :json
    nombreproducto = params['producto']
    begin
      res = @@almacen.buscarProducto(nombreproducto).listarCaracteristicasProducto()
      status 200
      {:caracteristicas => res}.to_json
    rescue StandardError
      status 400
      {:status => 'Error: no se encontró nada de este producto'}.to_json
    end
  end

  get '/producto/:producto/canjearCodigo/:codigo' do
    content_type :json
    begin
      n_codigo = params['codigo']
      nombreproducto = params['producto']
      begin
        res = @@almacen.buscarProducto(nombreproducto).canjearCodigo(n_codigo)
        status 200
        {:preciorebajado => res}.to_json
      rescue StandardError
        status 400
        {:status => 'Error: Este código no es válido'}.to_json
      end
    rescue StandardError
      status 400
      {:status => 'Este producto no está en el catálogo'}.to_json
    end
  end

  get '/tonos/:producto' do
    content_type :json
    nombreproducto = params['producto']
    begin
      res = @@almacen.buscarProducto(nombreproducto).tonosDisponibles()
      status 200
      {:tonos => res}.to_json
    rescue StandardError
      status 400
      {:status => 'Error: no hay tonos de este producto'}.to_json
    end
  end

  get '/descuento/:producto' do
    content_type :json
    begin
      nombreproducto = params['producto']
      res = @@almacen.buscarProducto(nombreproducto).consultarPrecioDescontado()
      begin
        status 200
        {:porcentajeDescuento => res}.to_json
      rescue StandardError
        status 400
        {:status => 'Este producto no tiene ningun descuento'}.to_json
      end
    rescue StandardError
      status 400
      {:status => 'Este producto no está en el catálogo'}.to_json
    end
  end

  get '/preciocesta' do
    content_type :json
    status 200
    res = @@cesta.calcularPrecioTotal()
    {:precioCesta => res}.to_json
  end

  post '/anadirCesta/:producto' do
    content_type :json
    nombreproducto = params['producto']
    begin
      productoCompra = @@almacen.buscarProducto(nombreproducto)
      @@cesta.anadirCesta(productoCompra)
      status 200
      {:anadidoCesta => nombreproducto}.to_json
    rescue StandardError
      status 400
      {:status => 'Error: Este producto no está en el catálogo'}.to_json
    end
  end

  delete '/quitarCesta/:producto' do
    content_type :json
    begin
      nombreproducto = params['producto']
      productoCompra = @@almacen.buscarProducto(nombreproducto)
      begin
        @@cesta.quitarCesta(productoCompra)
        status 200
        {:quitadoCesta => nombreproducto}.to_json
      rescue ArgumentError
        status 400
        {:status => 'Error: Este producto no está en tu cesta'}.to_json
      end
    rescue StandardError
      status 400
      {:status => 'Error: Este producto no está en el catálogo'}.to_json
    end
  end

  error 404 do
    content_type :json
    {:status => 'Error: ruta no encontrada'}.to_json
  end
end
