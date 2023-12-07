module Serverstart
  Bot.command :serverstart do |event|
    server_list = get_server_list
    servers = server_list.pluck('id')
    server_id = event.message.content.split[1]

    if servers.include?(server_id)
      serverstart(server_id)

      sent_message = event.respond('Server startet! Viel Spaß ^^')

      # Löschen der gesendeten Nachricht nach 10 Sekunden
      sleep(10)
      sent_message.delete
      event.message.delete
    else
      event.respond('Fehler beim starten des Servers, bitte überprüfe die ID')
    end
  end
end
