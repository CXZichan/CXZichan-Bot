# require 'discordrb'
# require 'dotenv'
# Dotenv.load


# COMMANDS_CHANNEL = 1134843806504730626
# AUTH_CHANNEL = 1134857105325699192

# Bot = Discordrb::Commands::CommandBot.new(
#     token: Rails.application.credentials.dig(:discord, :token),
#     client_id: Rails.application.credentials.dig(:discord, :client_id),
#     prefix: '/'
# )
# Dir["#{Rails.root}/app/commands/*.rb"].each { |file| require file }

# Bot.run(true)

# puts "Invite URL: #{Bot.invite_url}"
