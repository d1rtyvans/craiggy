# craiggy
The closest you'll get to a Craigslist API in your lifetime.

### Examples
```ruby
# Craiggy.get returns an array of `Post` objects
jerseys = Craiggy.get("Authentic Raiders Jersey")
jerseys.select(&:has_image?) # Select posts that have an image

xboxes  = Craiggy.get("Xbox One", area: "losangeles", max_price: 200)
xboxes.select { |xbox| xbox.location =~ /Culver City/ } # Filter posts by location

# Namespaces
ruby_jobs = Craiggy::Jobs.get("Ruby on Rails", area: "sfbay")
ruby_jobs.reject { |job| job.description =~ /intern/ } # Be a badass rubyist
```
