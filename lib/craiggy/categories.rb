class Craiggy
  CATEGORIES = {
    "Community" => "ccc",
    "Events"    => "eee",
    "ForSale"   => "sss",
    "Gigs"      => "ggg",
    "Housing"   => "hhh",
    "Jobs"      => "jjj",
    "Personals" => "ppp",
    "Resumes"   => "rrr",
    "Services"  => "bbb",
  }.freeze
end

Craiggy::CATEGORIES.each do |namespace, category_code|
  Craiggy.const_set(
    namespace,
    Class.new(Craiggy) { self::CATEGORY = category_code },
  )
end
