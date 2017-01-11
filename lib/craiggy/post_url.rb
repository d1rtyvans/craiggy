class Craiggy
  class PostUrl
    def initialize(item, category, *options)
      @item      = item
      @category  = category
      @options   = options.first || {}
    end

    def url
      "#{base_url}/search/#{category}?sort=rel&"\
      "#{price_range}query="\
      "#{item.downcase.split(' ') * '+'}"
    end

    private
      attr_reader :item, :category, :options

      def base_url
        "https://#{area}.craigslist.org"
      end

      def price_range
        query = ""
        query += "min_price=#{min_price}&" unless min_price.nil?
        query += "max_price=#{max_price}&" unless max_price.nil?
        query
      end

      def area
        options[:area] || "sfbay"
      end

      def min_price
        options[:min_price]
      end

      def max_price
        options[:max_price]
      end
  end
end
