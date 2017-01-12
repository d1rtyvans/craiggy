# Used for packaging Craigslist post data
class Craiggy
  class Post
    attr_reader :title, :image, :price, :location, :url, :description

    def initialize(page)
      post_params  = PostScraper.new(page).post_params
      @title       = post_params[:title]
      @image       = post_params[:image]
      @price       = post_params[:price]
      @location    = post_params[:location]
      @description = post_params[:description]
      @url         = post_params[:url]
    end

    def has_image?
      image != ""
    end
  end


  # Scrapes and formats `post_params` for easy `Post` initialization
  class PostScraper
    def initialize(page)
      @page = page
    end

    def post_params
      {
        image: image,
        title: title,
        price: price,
        location: location,
        description: description,
        url: page.uri.to_s,
      }
    end

    private

    attr_reader :page

    def posting_title
      page.at('span.postingtitletext')
    end

    def image
      image = page.at('img')
      image ? image['src'] : ''
    end

    def title
      page.at("#titletextonly").text
    end

    def price
      price = posting_title.at('span.price')
      price ? price.text.gsub(/\$/, '').to_i : 0
    end

    def location
      location = posting_title.at('small')
      location = location ? location.text.gsub(/ ?[\(\)]/, '') : ''
    end

    def description
      page.at('section#postingbody').children[2].text.strip
    end
  end
end
