ENV['APP_ENV'] = 'test'

require_relative '../sinatra/myapp.rb'
require 'rspec'
require 'rack/test'

RSpec.describe 'MyApp' do
  include Rack::Test::Methods

  def app
    MyApp
  end

end
