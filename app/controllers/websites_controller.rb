class WebsitesController < ApplicationController
	  require 'open-uri'
	  require 'nokogiri'

  def new
  	@website = Website.new
  	@websites = Website.all
  	
  end

  def create
  	@website = Website.new(website_params)
  	if @website.save
  		redirect_to new_website_path
  	end

  	input_url = website_params
  	url = input_url.to_s
  	url.slice! '{"url"=>"'
  	url.slice! '"}'
  	data = Nokogiri::HTML(open(url))
  	contents = data.css("html")
  	contents.each do |content|
		content.at_css("h1").text.strip
		content.at_css("p").text.strip
	end
  end

  def website_params
    params.require(:website).permit(:url)
  end


end
