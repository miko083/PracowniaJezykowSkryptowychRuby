require 'nokogiri'
require 'watir'

puts "Please enter product name: "
product_name = gets

url = 'https://allegro.pl/listing?string=' + product_name.gsub(' ','%20')

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
