require "test_helper"

class DiscordChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discord_channel = discord_channels(:one)
  end

  test "should get index" do
    get discord_channels_url
    assert_response :success
  end

  test "should get new" do
    get new_discord_channel_url
    assert_response :success
  end

  test "should create discord_channel" do
    assert_difference("DiscordChannel.count") do
      post discord_channels_url, params: { discord_channel: { body: @discord_channel.body, title: @discord_channel.title } }
    end

    assert_redirected_to discord_channel_url(DiscordChannel.last)
  end

  test "should show discord_channel" do
    get discord_channel_url(@discord_channel)
    assert_response :success
  end

  test "should get edit" do
    get edit_discord_channel_url(@discord_channel)
    assert_response :success
  end

  test "should update discord_channel" do
    patch discord_channel_url(@discord_channel), params: { discord_channel: { body: @discord_channel.body, title: @discord_channel.title } }
    assert_redirected_to discord_channel_url(@discord_channel)
  end

  test "should destroy discord_channel" do
    assert_difference("DiscordChannel.count", -1) do
      delete discord_channel_url(@discord_channel)
    end

    assert_redirected_to discord_channels_url
  end
end
