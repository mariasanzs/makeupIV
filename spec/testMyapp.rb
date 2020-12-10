ENV['APP_ENV'] = 'test'

require_relative '../sinatra/myapp.rb'
require 'rspec'
require 'rack/test'

RSpec.describe 'MyApp' do
  include Rack::Test::Methods

  @@cliente = 'cliente'
  @@almacen = Almacen.new
  @@obj = Maquillaje.new('prueba',[4, 5, 6, 7],10.0,5.0,[3, 2, 1, 7],TipoProducto::LABIOS,[['maria15','labios30'],[15,30]])
  @@almacen.anadirProducto(@@obj)
  @@cesta = Compra.new(@@cliente)

  def app
    MyApp
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
end
