require 'erb'
require_relative 'dathost_api'

# Angaben für die API-Authentifizierung
api_key = ENV['DATHOST_API_KEY']
server_id = ENV['DATHOST_SERVER_ID']

server_list = DatHostAPI.get_server_list(api_key, server_id)

if server_list
  # Laden der ERB-Vorlage
  template_file = File.read('server_list_template.html.erb')
  template = ERB.new(template_file)

  # ERB-Rendering in einer HTML-Datei
  output_html = template.result_with_hash(server_list: server_list)

  # Speichern des HTML-Outputs in einer Datei
  File.open('server_list.html', 'w') do |file|
    file.puts output_html
  end

  puts "Serverliste wurde in server_list.html gespeichert."
else
  puts "Fehler beim Abrufen der Serverliste."
end
