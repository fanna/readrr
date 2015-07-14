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
    
    @h1_title = ""
    @paragraph = ""
    @final_content = " "
  	input_url = website_params
  	url = input_url.to_s
  	url.slice! '{"url"=>"'
  	url.slice! '"}'
  	data = Nokogiri::HTML(open(url))
  	contents = data.css("html")
  	contents.each do |content|
		  @h1_title = content.css("h1").text.strip
		  @paragraph = content.css("p").text.strip
	  end

    @final_content = @h1_title + @paragraph
    puts @final_content.split(" ")
    
  end

  def website_params
    params.require(:website).permit(:url)
  end


end
