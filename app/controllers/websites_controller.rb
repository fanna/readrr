class WebsitesController < ApplicationController
	  require 'open-uri'
	  require 'nokogiri'
    require 'net/http'
    require_relative "lib/scrap_logic.rb"

  def new
  	@website = Website.new

  end

  def create

    @website = Website.new(website_params)
    url = params[:website][:url]

    array = scrap_it(url)
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
