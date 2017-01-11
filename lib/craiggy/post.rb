# Used for packaging Craigslist post data
class Craiggy
  class Post
    attr_reader :title, :image, :price, :location, :url, :description

    def initialize(args)
      @title       = args[:title]
      @image       = args[:image]
      @price       = args[:price]
      @location    = args[:location]
      @description = args[:description]
      @url         = args[:url]
    end

    def has_image?
      image != ""
    end
  end
end
