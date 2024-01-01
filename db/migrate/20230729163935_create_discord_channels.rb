# frozen_string_literal: true

class CreateDiscordChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :discord_channels do |t|
      t.string :channel_id
    end
  end
end
