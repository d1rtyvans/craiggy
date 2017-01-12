require "mechanize"

require "craiggy/post"
require "craiggy/post_url"
require "craiggy/categories"

class Craiggy
  CATEGORY = "sss"

  def self.get(item, *arguments)
    initialize(item, *arguments)
    scrape_posts
  end

  def self.categories
    self::CATEGORIES.keys
  end

  class << self
    private
      attr_reader :url

      def initialize(item, *arguments)
        @url = PostUrl.new(item, self::CATEGORY, *arguments).url
      end

      def scrape_posts
        matching_links.map { |link| Post.new(link.click) }
      end

      def matching_links
        mech.get(url).links_with(dom_class: "result-title hdrlnk")
      end

      def mech
        Mechanize.new do |agent|
          agent.robots = false
          agent.user_agent_alias = "Mac Safari"
        end
      end
  end
end
