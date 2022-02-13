require 'nokogiri'
require 'watir'

# Temp -> komputer gamingowy
# $url = 'https://allegro.pl/listing?string=komputer%20gamingowy'

puts "Please enter category and / or product name. If product name is empty, only the entered category will be searched. If category name is empty, the product will be searched in all categories."

puts "Please enter category name: "
category_name = gets

puts "Please enter product name: "
product_name = gets

$url = 'https://allegro.pl/listing?string=' + product_name.gsub(' ','%20')

browser = Watir::Browser.new :firefox
browser.goto $url
page = Nokogiri::HTML.parse(browser.html)

for product in page.search('section article')
    puts "==========="
    puts "Name: " + product.search('h2 div').text
    puts "Price: " + product.search('div span').search('span[class="_1svub _lf05o"]').text
    puts "==========="
end
