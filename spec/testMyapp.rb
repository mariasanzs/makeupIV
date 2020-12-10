ENV['APP_ENV'] = 'test'

require_relative '../sinatra/myapp.rb'
require 'rspec'
require 'rack/test'

RSpec.describe 'MyApp' do
  include Rack::Test::Methods

  def app
    MyApp
  end

  describe "Pagina Inicial" do
    it 'ruta inicial ok' do
      get '/'
      respuesta = {:status => 'ok'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('text/html;charset=utf-8')
      expect(last_response).to be_ok
    end
  end
  describe "disponibilidad de un producto" do
    it 'disponibilidad ok' do
      get '/disponibilidad/prueba'
      res = [3,2,1,7]
      respuesta = {:unidadesDisponibles => res}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end

    it 'disponibilidad error' do
      get '/disponibilidad/noexisto'
      respuesta = {:status => 'Error: no hay disponibilidad de este producto'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end
  end

  describe "caracteristicas de un producto" do
    it 'caracteristicas ok' do
      get '/caracteristicas/prueba'
      res = " Detalles del producto:\n    Nombre: prueba\n    Tipo: labios\n    Tonos: [4, 5, 6, 7]\n    Tonos disponibles: [4, 5, 6, 7]\n    Precio: 10.0\n    Precio Rebajado: 5.0\n    Ahorras un 50.0%\n    Unidades de cada tono: [3, 2, 1, 7] \n"
      respuesta = {:caracteristicas => res}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end

    it 'caracteristicas error' do
      get '/caracteristicas/noexisto'
      respuesta = {:status => 'Error: no se encontró nada de este producto'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end
  end

  describe "Canjear código de un producto" do
    it 'Canjear código ok' do
      get '/producto/prueba/canjearCodigo/maria15'
      res = 4.25
      respuesta = {:preciorebajado => res}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end

    it 'Canjear código error no existe producto' do
      get '/producto/noexisto/canjearCodigo/maria15'
      respuesta = {:status => 'Error: Este producto no está en el catálogo'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end

    it 'Canjear código error no existe código' do
      get '/producto/prueba/canjearCodigo/noexisto'
      respuesta = {:status => 'Error: Este código no es válido'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end
  end

  describe "tonos disponibles de un producto" do
    it 'tonos ok' do
      get '/tonos/prueba'
      res = [4,5,6,7]
      respuesta = {:tonos => res}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end

    it 'tonos error' do
      get '/tonos/noexisto'
      respuesta = {:status => 'Error: No hay tonos de este producto'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end
  end

  describe "porcentaje descuento de un producto" do
    it 'descuento ok' do
      get '/descuento/prueba'
      res = 57.5
      respuesta = {:porcentajeDescuento => res}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end

    it 'descuento error no existe producto' do
      get '/descuento/noexisto'
      respuesta = {:status => 'Error: Este producto no está en el catálogo'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end
  end

  describe "precios de la cesta" do
    it 'preciocesta ok' do
      get '/preciocesta'
      res = 0
      respuesta = {:precioCesta => res}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end
  end

  describe "Insertar un producto en la cesta" do
    it 'añadir cesta ok' do
      post '/anadirCesta/prueba'
      res = 'prueba'
      respuesta = {:anadidoCesta => res}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end

    it 'añadir cesta error no existe producto' do
      post '/anadirCesta/noexisto'
      respuesta = {:status => 'Error: Este producto no está en el catálogo'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end
  end

  describe "Quitar un producto en la cesta" do
    it 'quitar cesta ok' do
      delete '/quitarCesta/prueba'
      res = 'prueba'
      respuesta = {:quitadoCesta => res}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end

    it 'añadir cesta error no existe producto' do
      delete '/quitarCesta/noexisto'
      respuesta = {:status => 'Error: Este producto no está en el catálogo'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end

    it 'añadir cesta error no está en la cesta' do
      delete '/quitarCesta/prueba'
      respuesta = {:status => 'Error: Este producto no está en tu cesta'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (400)
    end
  end

  describe "Hay un error 404" do
    it "no existe la ruta" do
      get '/error404'
      respuesta = {:status => 'Error: ruta no encontrada'}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response.status).to eq (404)
    end
  end
end
