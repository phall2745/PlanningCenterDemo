
require 'faraday'
require 'json'
class Connection
  BASE = 'https://api.planningcenteronline.com/services/v2/songs'

  def self.api
    Faraday.new(url: BASE) do |faraday|
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['X-Mashape-Key'] = ENV['MASHAPE_KEY']
    end
  end
end