# myapp.rb

require 'sinatra'
require 'json'
require 'logger'

require_relative '../src/almacen.rb'
require_relative '../src/compra.rb'

class MyApp < Sinatra::Base

  log = ::Logger.new(File.join(File.dirname(File.expand_path(__FILE__)),'.','log','info.log'))

  configure do
    use ::Rack::CommonLogger, log
  end

  @@cliente = 'clientepordefecto'
  @@almacen = Almacen.new
  @@obj = Maquillaje.new('prueba',[4, 5, 6, 7],10.0,5.0,[3, 2, 1, 7],TipoProducto::LABIOS,[['maria15','labios30'],[15,30]])
  @@almacen.anadirProducto(@@obj)
  @@cesta = Compra.new(@@cliente)

  get '/' do
    log.info "Accediendo a la página principal de MakeupIV"
    {:status => 'ok'}.to_json
  end

  get '/disponibilidad/:producto' do
    content_type :json
    nombreproducto = params['producto'].to_s
    begin
      res = @@almacen.buscarProducto(nombreproducto).consultarUnidadesDisponibles()
      log.info "Accediendo a la disponibilidad de un producto"
      status 200
      {:unidadesDisponibles => res}.to_json
    rescue StandardError
      log.info "ERROR!!! -> Accediendo a la disponibilidad de un producto"
      status 400
      {:status => "Error: no hay disponibilidad de este producto"}.to_json
    end
  end

  get '/caracteristicas/:producto' do
    content_type :json
    nombreproducto = params['producto']
    begin
      res = @@almacen.buscarProducto(nombreproducto).listarCaracteristicasProducto()
      log.info "Accediendo a las caracteristicas de un producto"
      status 200
      {:caracteristicas => res}.to_json
    rescue StandardError
      log.info "ERROR!!! -> Accediendo a las caracteristicas de un producto"
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
        log.info "Canjeando código de un producto"
        status 200
        {:preciorebajado => res}.to_json
      rescue StandardError
        status 400
        log.info "ERROR!!! -> Canjeando código de un producto"
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
      log.info "Obteniendo tonos de un producto"
      status 200
      {:tonos => res}.to_json
    rescue StandardError
      status 400
      log.info "ERROR!!! -> Obteniendo tonos de un producto"
      {:status => 'Error: No hay tonos de este producto'}.to_json
    end
  end

  get '/descuento/:producto' do
    content_type :json
    begin
      nombreproducto = params['producto']
      prod = @@almacen.buscarProducto(nombreproducto)
      begin
        log.info "Consultando descuento de un producto"
        res = prod.consultarPrecioDescontado()
        status 200
        {:porcentajeDescuento => res}.to_json
      rescue StandardError
        status 400
        {:status => 'Error: Este producto no tiene ningun descuento'}.to_json
      end
    rescue StandardError
      log.info "ERROR!!! -> Consultando descuento de un producto"
      status 400
      {:status => 'Error: Este producto no está en el catálogo'}.to_json
    end
  end

  get '/preciocesta' do
    content_type :json
    status 200
    log.info "Obteniendo precio total de la cesta"
    res = @@cesta.calcularPrecioTotal()
    {:precioCesta => res}.to_json
  end

  post '/anadirCesta/:producto' do
    content_type :json
    nombreproducto = params['producto']
    begin
      productoCompra = @@almacen.buscarProducto(nombreproducto)
      log.info "Añadiendo un producto a la cesta"
      @@cesta.anadirCesta(productoCompra)
      status 200
      {:anadidoCesta => nombreproducto}.to_json
    rescue StandardError
      log.info "ERROR!!! -> Añadiendo un producto a la cesta"
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
        log.info "Quitando un producto de la cesta"
        @@cesta.quitarCesta(productoCompra)
        status 200
        {:quitadoCesta => nombreproducto}.to_json
      rescue ArgumentError
        status 400
        {:status => 'Error: Este producto no está en tu cesta'}.to_json
      end
    rescue StandardError
      status 400
      log.info "ERROR!!! -> Quitando un producto de la cesta"
      {:status => 'Error: Este producto no está en el catálogo'}.to_json
    end
  end


  delete '/quitarProducto/:producto' do
    content_type :json
    nombreproducto = params['producto']
    begin
      productoCompra = @@almacen.buscarProducto(nombreproducto)
      begin
        log.info "Quitando producto del almacén"
        @@almacen.quitarProducto(productoCompra)
        status 200
        {:quitadoAlmacen => nombreproducto }.to_json
      rescue ArgumentError
        log.info "ERROR!!! -> Quitando producto del almacén"
        status 400
      end
      rescue StandardError
        log.info "ERROR!!! -> Quitando producto del almacén"
        status 400
        {:status => 'Error: Este producto no está en tu almacen'}.to_json
      end
  end


  error 404 do
    content_type :json
    log.info "ERROR!!! -> ruta no encontrada"
    {:status => 'Error: ruta no encontrada'}.to_json
  end
end
