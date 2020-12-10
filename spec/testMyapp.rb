ENV['APP_ENV'] = 'test'

require_relative '../src/myapp.rb'
require 'rspec'
require 'rack/test'

RSpec.describe 'MyApp' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "test_everything_ok" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("{:status => 'ok'}")
  end
end
