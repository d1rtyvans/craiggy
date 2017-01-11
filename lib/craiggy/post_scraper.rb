# Scrapes craigslist posts and packages data in Post objects
class Craiggy
  class PostScraper
    def initialize(page)
      @page = page
    end

    def new_post
      Post.new(post_params)
    end

    private

    attr_reader :page

    def posting_title
      page.at('span.postingtitletext')
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
