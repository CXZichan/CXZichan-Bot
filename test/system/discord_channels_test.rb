# frozen_string_literal: true

require 'application_system_test_case'

class DiscordChannelsTest < ApplicationSystemTestCase
  setup do
    @discord_channel = discord_channels(:one)
  end

  test 'visiting the index' do
    visit discord_channels_url
    assert_selector 'h1', text: 'Discord channels'
  end

  test 'should create discord channel' do
    visit discord_channels_url
    click_on 'New discord channel'

    fill_in 'Body', with: @discord_channel.body
    fill_in 'Title', with: @discord_channel.title
    click_on 'Create Discord channel'

    assert_text 'Discord channel was successfully created'
    click_on 'Back'
  end

  test 'should update Discord channel' do
    visit discord_channel_url(@discord_channel)
    click_on 'Edit this discord channel', match: :first

    fill_in 'Body', with: @discord_channel.body
    fill_in 'Title', with: @discord_channel.title
    click_on 'Update Discord channel'

    assert_text 'Discord channel was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Discord channel' do
    visit discord_channel_url(@discord_channel)
    click_on 'Destroy this discord channel', match: :first

    assert_text 'Discord channel was successfully destroyed'
  end
end
