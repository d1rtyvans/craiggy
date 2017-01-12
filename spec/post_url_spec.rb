require "spec_helper"
require "craiggy/post_url"

RSpec.describe Craiggy::PostUrl do
  describe "#url" do
    let(:item)     { "Tube Sox" }
    let(:category) { "sss" }
    let(:options)  { [] }
    let(:url)      { Craiggy::PostUrl.new(item, category, *options).url }

    it "returns correct url when given an item name and category" do
      expect(url).to eq("https://sfbay.craigslist.org/search/sss?sort=rel&query=tube+sox")
    end

    context "area" do
      let(:options) { [{ area: "losangeles" }] }

      it "applies :area subdomain when argument is given" do
        expect(url).to eq("https://losangeles.craigslist.org/search/sss?sort=rel&query=tube+sox")
      end
    end

    context "prince range" do
      let(:options) { [{min_price: 500, max_price: 9000}] }

      it "applies min_price and max_price to url query" do
        expect(url).to eq(
          "https://sfbay.craigslist.org/search/sss?sort=rel&"\
          "min_price=500&max_price=9000&query=tube+sox"
        )
      end
    end

    context "category" do
      let(:category) { "aaa" }
      
      it "applies category to url" do
      expect(url).to eq("https://sfbay.craigslist.org/search/aaa?sort=rel&query=tube+sox")
      end
    end
  end
end
