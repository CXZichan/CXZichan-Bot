module Ping
    extend Discordrb::Commands::CommandContainer

    Bot.message(content: '!Ping') do |event|
        event.respond 'Pong! Message'
    end

    Bot.command(:ping) do |event|
        if Bot.user.role == 'Moderator'
        event.respond 'Poong! Command with double o'
        end
    end
end
