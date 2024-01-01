# frozen_string_literal: true

require 'discordrb'
require 'uri'
require 'net/http'
require 'json'
Dotenv.load

@username = ENV['DATHOST_USERNAME']
@password = ENV['DATHOST_PASSWORD']

COMMANDS_CHANNEL = 1_134_843_806_504_730_626
AUTH_CHANNEL = 1_134_857_105_325_699_192

Bot = Discordrb::Commands::CommandBot.new(
  token: Rails.application.credentials.dig(:discord, :token),
  client_id: Rails.application.credentials.dig(:discord, :client_id),
  prefix: '/'
)

Dir["#{Rails.root}/app/commands/*.rb"].each { |file| require file }

def get_server_list
  @username = ENV['DATHOST_USERNAME']
  @password = ENV['DATHOST_PASSWORD']

  url = URI('https://dathost.net/api/0.1/game-servers')

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request['accept'] = 'application/json'
  request.basic_auth(@username, @password) # Füge die Authentifizierung hinzu

  response = http.request(request)
  if response.code == '200'
    JSON.parse(response.body)
    # Verarbeite die Spieleliste hier weiter
  else
    puts "Fehler: #{response.code} - #{response.message}"
  end
end

def serverstart(server_id)
  @username = ENV['DATHOST_USERNAME']
  @password = ENV['DATHOST_PASSWORD']

  url = URI("https://dathost.net/api/0.1/game-servers/#{server_id}/start")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Post.new(url)
  # request["content-type"] = 'multipart/form-data'
  request.basic_auth(@username, @password) # Füge die Authentifizierung hinzu

  response = http.request(request)
  if response.code == '200'
    JSON.parse(response.body)
  # Verarbeite die Spieleliste hier weiter
  else
    puts "Fehler: #{response.code} - #{response.message}"
  end
end

Bot.run(true)

puts "Invite URL: #{Bot.invite_url}"
