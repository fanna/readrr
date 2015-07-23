class WebsitesController < ApplicationController

  def new
    @website = Website.new
  end

  def create
    @website = Website.new(website_params)

    @website.content = ContentExtractor.new(@website.url).extract

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
