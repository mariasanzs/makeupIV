require 'json'
require 'telegram/bot'

def misdatospersonales(event:, context:)
  client = Aws::Translate::Client.new
  bot = Telegram::Bot::Client.new(ENV["TG_TOKEN"])
  message = JSON.parse(event["body"])["message"]

  mensaje = "hola"

  bot.api.send_message(chat_id: message["chat"]["id"], text: mensaje)

  {
    "statusCode": 200,
    "headers": {},
    "body": mensaje,
    "isBase64Encoded": false
  }
end
