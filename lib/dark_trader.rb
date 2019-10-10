require 'rubygems'
require 'nokogiri'
require 'open-uri'




def scrapper

	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

	devise = []

	crypto_name = page.xpath('//td[contains(@class, "text-left")]').each do |name|

		devise << name.text

	end

	amount = []
	crypto_currencies = page.xpath('//a[contains(@class, "price")]').each do |money|

		 amount << money.text
	end
		
		myHash  = Hash[devise.zip(amount)]



		 a = []
		 myHash.each do |b,c|
		   hash = {}
		   
		   a << hash
		
		end	
		p a
end

	scrapper
