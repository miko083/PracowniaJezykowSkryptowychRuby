require 'nokogiri'
require 'watir'

url = "https://allegro.pl/kategoria/komputery"

browser = Watir::Browser.new :firefox
browser.goto url
page = Nokogiri::HTML.parse(browser.html)

# span[class="_1svub _lf05o"] has information about price
for product in page.search('section article')
    puts "==========="
    puts "Name: " + product.search('h2 div').text
    puts "Price: " + product.search('div span').search('span[class="_1svub _lf05o"]').text
    puts "==========="
end
