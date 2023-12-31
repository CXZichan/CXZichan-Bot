# frozen_string_literal: true

module Server
  Bot.command :serverlist do |event|
    server_list = get_server_list
    if server_list
      # Formatieren der Serverliste
      formatted_list = "Serverliste:\n"
      formatted_list += "----------------------------------\n"
      server_list.each do |server|
        status = server['on']

        status = if status == false
                   'Offline'
                 else
                   'Online'
                 end

        formatted_list += "Name: #{server['name']}\n"
        formatted_list += "ID: #{server['id']}\n"
        formatted_list += "Game: #{server['game']}\n"
        formatted_list += "Status: #{status}\n"
        formatted_list += "Players Online: #{server['players_online']}\n"
        formatted_list += "Location: #{server['location']}\n"
        formatted_list += "IP: connect #{server['custom_domain']}:#{server['ports']['game']}; password #{server['cs2_settings']['password']}\n"
        formatted_list += "----------------------------------\n\n"
      end

      event.respond(formatted_list)

      # Löschen der gesendeten Nachricht nach 10 Sekunden
      sleep(10)
      event.message.delete

    else
      event.respond('Fehler beim Abrufen der Serverliste.')
    end
  end
end
