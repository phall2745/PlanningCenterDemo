require "json"
class SongsController < ApplicationController


  def index

    begin
      api = PCO::API.new(basic_auth_token: Rails.application.config.pco_api_key, basic_auth_secret: Rails.application.config.pco_api_secret)
      pageSize = 100
      offset = pageSize + 1
      songsCache=$redis.get("songs")

      if songsCache != nil
        @songs = JSON.parse(songsCache)

      else
        response = api.services.v2.songs.get(order: 'title', per_page: 100)
        @songs = response["data"]
        while response["meta"]["next"] != nil
          response = api.services.v2.songs.get(order: 'title', per_page: 100, offset: offset)
          @songs += response["data"]
          offset += 100
        end
        $redis.set("songs", @songs.to_json)
      end

    rescue Exception
      render 'welcome/error'
    end
  end

  def show

    begin
      api = PCO::API.new(basic_auth_token: Rails.application.config.pco_api_key, basic_auth_secret: Rails.application.config.pco_api_secret)
      response = api.services.v2.songs[params[:id]].get()
      @song = response["data"]
    rescue Exception
      render 'welcome/error'
    end
  end

end
