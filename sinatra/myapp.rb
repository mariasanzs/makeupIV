# myapp.rb

require 'sinatra'
require 'json'
require 'logger'

require_relative '../src/almacen.rb'
require_relative '../src/compra.rb'

class MyApp < Sinatra::Base

  configure :production do
    log = ::Logger.new(File.join(File.dirname(File.expand_path(__FILE__)),'.','log','info.log'))
    use ::Rack::CommonLogger, log
  end

  @@cliente = 'clientepordefecto'
  @@almacen = Almacen.new
  @@obj = Maquillaje.new('prueba',[4, 5, 6, 7],10.0,5.0,[3, 2, 1, 7],TipoProducto::LABIOS,[['maria15','labios30'],[15,30]])
  @@almacen.anadirProducto(@@obj)
  @@cesta = Compra.new(@@cliente)

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
      {:status => "Error: no hay disponibilidad de este producto"}.to_json
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
      prod = @@almacen.buscarProducto(nombreproducto)
      begin
        res = prod.canjearCodigo(n_codigo)
        status 200
        {:preciorebajado => res}.to_json
      rescue StandardError
        status 400
        {:status => 'Error: Este código no es válido'}.to_json
      end
    rescue StandardError
      status 400
      {:status => 'Error: Este producto no está en el catálogo'}.to_json
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
      {:status => 'Error: No hay tonos de este producto'}.to_json
    end
  end

  get '/descuento/:producto' do
    content_type :json
    begin
      nombreproducto = params['producto']
      prod = @@almacen.buscarProducto(nombreproducto)
      begin
        res = prod.consultarPrecioDescontado()
        status 200
        {:porcentajeDescuento => res}.to_json
      rescue StandardError
        status 400
        {:status => 'Error: Este producto no tiene ningun descuento'}.to_json
      end
    rescue StandardError
      status 400
      {:status => 'Error: Este producto no está en el catálogo'}.to_json
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


  delete '/quitarProducto/:producto' do
    content_type :json
    nombreproducto = params['producto']
    begin
      productoCompra = @@almacen.buscarProducto(nombreproducto)
      begin
        @@almacen.quitarProducto(productoCompra)
        status 200
        {:quitadoAlmacen => nombreproducto }.to_json
      rescue ArgumentError
        status 400
      end
      rescue StandardError
        status 400
        {:status => 'Error: Este producto no está en tu almacen'}.to_json
      end
  end


  error 404 do
    content_type :json
    {:status => 'Error: ruta no encontrada'}.to_json
  end
end
