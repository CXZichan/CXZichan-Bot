json.extract! discord_channel, :id, :title, :body, :created_at, :updated_at
json.url discord_channel_url(discord_channel, format: :json)
