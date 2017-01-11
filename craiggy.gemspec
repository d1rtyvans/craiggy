Gem::Specification.new do |s|
  s.name        = "craiggy"
  s.version     = "3.1.0"
  s.date        = "2016-01-15"
  s.summary     = "Scrape posts from Craigslist with an easy API"
  s.description = "All you need is an item title and Craiggy will scrape Craigslist and return an array of Posts pertaining to the item."
  s.authors     = ["Chris Scott"]
  s.email       = "christo247@gmail.com"
  s.files       = Dir["lib/*.rb"] + Dir["lib/craiggy/*.rb"]
  s.homepage    = "https://github.com/steezyduzit/craiggy"
  s.license     = "MIT"

  s.add_dependency "mechanize"
end
