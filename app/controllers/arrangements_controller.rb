class ArrangementsController < ApplicationController

  def index
    begin
      api = PCO::API.new(basic_auth_token: Rails.application.config.pco_api_key, basic_auth_secret: Rails.application.config.pco_api_secret)
      response = api.services.v2.songs[params[:song_id]].arrangements.get()
      @arrangements = response["data"]
    rescue Exception
      render 'welcome/error'

    end
  end

  def show
    begin
      api = PCO::API.new(basic_auth_token: Rails.application.config.pco_api_key, basic_auth_secret: Rails.application.config.pco_api_secret)
      response = api.services.v2.songs[params[:song_id]].arrangements[params[:id]].get()
      @arrangement = response["data"]
      response = api.services.v2.songs[params[:song_id]].arrangements[params[:id]].attachments.get()
      @attachments = response["data"]
      @attachmentsNew = updateAttachmentURL(@attachments, api)
    rescue Exception
      render 'welcome/error'
    end

  end

  private

  def updateAttachmentURL(attachments, api)
    attachmentsNew = attachments
    count = 0
    attachments.each do |attachment|
      response = api.services.v2.songs[params[:song_id]].arrangements[params[:id]].attachments[attachment["id"]].open.post()
      attachmentsNew[count]["attributes"]["url"] = response["data"]["attributes"]["attachment_url"]
      count += 1
    end
  end


end
