Gem::Specification.new do |s|
  s.name        = "craiggy"
  s.version     = "0.0.1"
  s.licenses    = ["MIT"]
  s.date        = "2017-01-15"
  s.summary     = "Scrape posts from Craigslist with an easy API"
  s.description = "All you need is an item title and Craiggy will scrape Craigslist and return an array of Posts pertaining to the item."
  s.authors     = ["Chris Scott"]
  s.email       = "christo247@gmail.com"
  s.files       = ["lib/craiggy.rb"] + Dir["lib/craiggy/*.rb"]
  s.homepage    = "https://github.com/steezyduzit/craiggy"

  s.add_dependency "mechanize", "~> 2.7"

  s.add_development_dependency "rspec", "~> 3.4"
  s.add_development_dependency "webmock", "~> 1.22"
  s.add_development_dependency "vcr", "~> 3.0"
end
