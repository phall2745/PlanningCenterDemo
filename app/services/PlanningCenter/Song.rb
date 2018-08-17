module PlanningCenter
  class Song < Base
    attr_accessor :type,
                  :id,
                  :attributes,
                  :relationships

    MAX_LIMIT = 12

    def self.random(query = {})
      response = Request.where('songs/random', query.merge({ number: MAX_LIMIT }))
      songs = response.fetch('songs', []).map { |song| Song.new(song) }
      [ songs, response[:errors] ]
    end

    def self.find(id)
      response = Request.get("songs/#{id}")
      Song.new(response)
    end

    def initialize(args = {})
      super(args)
      self.attributes = parse_attributes(args)
    end

    def parse_attributes(args = {})
      args.fetch("attributes", []).map { |attribute| Attribute.new(attribute) }
    end


  end
end