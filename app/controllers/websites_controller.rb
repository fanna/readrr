class WebsitesController < ApplicationController
	  require 'open-uri'
	  require 'nokogiri'
    require 'net/http'

  def new
  	@website = Website.new

  end

  def create
  	@website = Website.new(website_params)

    @h1_title = ""
    @paragraph = ""
    @final_content = " "

    url = params[:website][:url]

    data = Nokogiri::HTML(open(url))
    contents = data.css("html")
    contents.each do |content|
      @h1_title = content.css("h1").text.strip
      @paragraph = content.css("p").text.strip
    end

    @final_content = @h1_title + @paragraph

    array = Array.new
    array = @final_content.split(" ")

    @website.content = array


  	if @website.save
  		redirect_to new_website_path
  	end
  end

    def show
      @website = Website.find(params[:id])
      @array = @website.content

    end

    def index
      @websites = Website.all
    end



  def website_params
    params.require(:website).permit(:url)
  end


end
