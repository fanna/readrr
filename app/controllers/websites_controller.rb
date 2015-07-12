class WebsitesController < ApplicationController
	  ##require 'open-uri'
	  ##require 'net/http'
	  ##require 'uri'



	  

  def new
  	@website = Website.new
  	@websites = Website.all
  	
  	##website = @website.to_s
  	##encoded_url = URI.encode(website)
  	##uri = URI.parse(encoded_url)
  	##Nokogiri::HTML::Document.parse(HTTParty.get(encoded_url).body).title
  end

  def create
  	@website = Website.new(website_params)
  	if @website.save
  		redirect_to new_website_path
  	end
  end

  def website_params
    params.require(:website).permit(:url)
  end

end
