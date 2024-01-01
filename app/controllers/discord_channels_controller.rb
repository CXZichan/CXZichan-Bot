# frozen_string_literal: true

class DiscordChannelsController < ApplicationController
  before_action :set_discord_channel, only: %i[show edit update destroy]

  # GET /discord_channels or /discord_channels.json
  def index
    @discord_channels = DiscordChannel.all
  end

  # GET /discord_channels/1 or /discord_channels/1.json
  def show; end

  # GET /discord_channels/new
  def new
    @discord_channel = DiscordChannel.new
  end

  # GET /discord_channels/1/edit
  def edit; end

  # POST /discord_channels or /discord_channels.json
  def create
    @discord_channel = DiscordChannel.new(discord_channel_params)

    respond_to do |format|
      if @discord_channel.save
        format.html do
          redirect_to discord_channel_url(@discord_channel), notice: 'Discord channel was successfully created.'
        end
        format.json { render :show, status: :created, location: @discord_channel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discord_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discord_channels/1 or /discord_channels/1.json
  def update
    respond_to do |format|
      if @discord_channel.update(discord_channel_params)
        format.html do
          redirect_to discord_channel_url(@discord_channel), notice: 'Discord channel was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @discord_channel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discord_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discord_channels/1 or /discord_channels/1.json
  def destroy
    @discord_channel.destroy

    respond_to do |format|
      format.html { redirect_to discord_channels_url, notice: 'Discord channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_discord_channel
    @discord_channel = DiscordChannel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def discord_channel_params
    params.require(:discord_channel).permit(:title, :body)
  end
end
