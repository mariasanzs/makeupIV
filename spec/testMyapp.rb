ENV['APP_ENV'] = 'test'

require_relative '../sinatra/myapp.rb'
require 'rspec'
require 'rack/test'

RSpec.describe 'MyApp' do
  include Rack::Test::Methods

  def app
    MyApp
  end

  describe "precios de la cesta" do
    it 'precio cesta correcto' do
      get '/preciocesta'
      res = 0
      respuesta = {:precioCesta => res}.to_json
      expect(last_response.body).to eq (respuesta)
      expect(last_response.content_type).to eq ('application/json')
      expect(last_response).to be_ok
    end
  end
end
