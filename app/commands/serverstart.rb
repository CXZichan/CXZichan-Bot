module Serverstart
  Bot.command :serverstart do |event|
    server_list = get_server_list
    servers = server_list.pluck('id')
    server_id = event.message.content.split[1]

    if servers.include?(server_id)
      serverstart(server_id)
      event.respond('Server startet! Viel Spaß ^^')
    else
      event.respond('Fehler beim starten des Servers, bitte überprüfe die ID')
    end
  end
end
