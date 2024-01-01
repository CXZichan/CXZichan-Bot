# frozen_string_literal: true

module Ping
  extend Discordrb::Commands::CommandContainer

  Bot.message(content: '!Ping') do |event|
    event.respond 'Pong! Message'
  end

  Bot.command(:ping) do |event|
    event.respond 'Poong! Command with double o' if Bot.user.role == 'Moderator'
  end
end
