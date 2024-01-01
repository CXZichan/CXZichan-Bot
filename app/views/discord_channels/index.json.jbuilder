# frozen_string_literal: true

json.array! @discord_channels, partial: 'discord_channels/discord_channel', as: :discord_channel
