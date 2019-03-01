require 'Nokogiri'
require 'open-uri'

url = 'https://garden.org/plants/view/545484/Aloe-Pink-Blush/'


def scrape(url)
  doc = Nokogiri::HTML(open(url))
  table = doc.at("table")
  hash = {}
  hash["latin_name"] = doc.at("h1").content

  table.search('tr').each do |tr|
    a = tr.content.split(':')[0]
    b = tr.content.split(":")[1]
    hash[a.strip.gsub(" ","_").downcase] = b.strip.gsub("\n", ". ")
  end

  hash
end

puts scrape(url)
