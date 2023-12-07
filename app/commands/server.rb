module Server
  Bot.command :serverlist do |event|
    server_list = get_server_list
    if server_list
      # Formatieren der Serverliste
      formatted_list = "Serverliste:\n"
      server_list.each do |server|

        formatted_list += "Name: #{server['name']}\n"
        formatted_list += "ID: #{server['id']}\n"
        formatted_list += "Game: #{server['game']}\n"
        formatted_list += "Players Online: #{server['players_online']}\n"
        formatted_list += "Location: #{server['location']}\n"
        formatted_list += "IP: connect #{server['custom_domain']}:#{server['ports']['game']}; password #{server['cs2_settings']['password']}\n"
        formatted_list += "----------------------------------\n\n"
      end
      # Senden der formatierten Liste in den Discord-Chat
      event.respond(formatted_list)
    else
      event.respond('Fehler beim Abrufen der Serverliste.')
    end
  end
end
