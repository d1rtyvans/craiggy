require "spec_helper"
require "support/url_matchers"
require "vcr"
require "craiggy"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.describe Craiggy do
  describe ".get" do
    it "returns an array of Posts pertinent to item name" do
      VCR.use_cassette("harley") do
        harleys = Craiggy.get("Harley Davidson Fat Bob")
        harley = harleys.first

        expect(harley).to have_image
        expect(harley).to have_attributes(
          title: "2013 Harley Davidson Fat Bob (FXDF)",
          url: "https://sfbay.craigslist.org/eby/mcy/5956359951.html",
          image: "https://images.craigslist.org/00909_6TstNd8cipf_600x450.jpg",
          price: 12500,
          location: "fairfield / vacaville",
          description: "2013 Harley Davidson Fat Bob (FXDF)",
        )
      end
    end
  end

  describe ".categories" do
    it "returns hash of possible category namespaces" do
      expect(Craiggy.categories).to eq([
        "Community",
        "Events",
        "ForSale",
        "Gigs",
        "Housing",
        "Jobs",
        "Personals",
        "Resumes",
        "Services",
      ])
    end
  end

  context "namespaces" do
    before do
      double = double(Craiggy::PostUrl, url: "")
      allow(Craiggy::PostUrl).to receive(:new).and_return(double)
      allow(Craiggy).to receive(:scrape_posts)
    end

    expect_to_format_url("Community", "Beer", "ccc")
    expect_to_format_url("Events", "Moar Beer", "eee")
    expect_to_format_url("ForSale", "Carz", "sss")
    expect_to_format_url("Gigs", "Engineer", "ggg")
    expect_to_format_url("Housing", "Mansion", "hhh")
    expect_to_format_url("Jobs", "Ruby on Rails", "jjj")
    expect_to_format_url("Personals", "Escort", "ppp")
    expect_to_format_url("Resumes", "Shredder", "rrr")
    expect_to_format_url("Services", "Beer Drinker", "bbb")
  end
end
