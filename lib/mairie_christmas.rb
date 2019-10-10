require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

	

def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open(townhall_url))

	mairie = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text

end

#get_townhall_email(url)

def get_townhall_urls

 	page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
 	@array_ville = Array.new

 	ville = page.xpath('//a[contains(@class, "lientxt")]').each do |email|
 		@array_ville << email.text
 	end

	new_array = Array.new
	url = ""
    @array_ville.each  do |ville|

	  	url =  "http://annuaire-des-mairies.com/95/#{ville}.html"

		new_array << url.downcase.gsub(' ', '-')
    end
    new_array
end
#get_townhall_urls


def perform
	final_array = Array.new
	get_townhall_urls.each do |handle|
		final_array << get_townhall_email(handle)
	end
	my_hash = Hash.new
	my_hash = Hash[@array_ville.zip(final_array)]

	p my_hash

	a = []
		 my_hash.each do |k,v|
		   hash = {}
		   hash[k] = v
		   a << hash
		
		end	
		p a
end
perform




