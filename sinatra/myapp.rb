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

  error 404 do
    content_type :json
    {:status => 'Error: ruta no encontrada'}.to_json
  end
end
