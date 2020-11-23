require 'json'
require 'net/https'

TOKEN = ENV['TG_TOKEN']

def misdatospersonales(event:, context:)
  data = JSON.parse(event["body"])
  message = data["message"]["text"]
  chat_id = data["message"]["chat"]["id"]
  first_name = data["message"]["chat"]["first_name"]


  msg = "hola"
  payload = {text: msg, chat_id: chat_id}

 uri = URI("https://api.telegram.org")

 Net::HTTP.start(uri.hostname, uri.port, {use_ssl: true}) do |http|
     req = Net::HTTP::Get.new("/bot#{TOKEN}/sendMessage", {'Content-Type' => 'application/json; charset=utf-8'})
     req.body = payload.to_json
     http.request(req)
 end

     return { statusCode: 200 }
 end
