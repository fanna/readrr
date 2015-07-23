class ScrapLogic
  require 'open-uri'
  require 'nokogiri'

  def scrap_it(url)
    @h1_title = ""
    @paragraph = ""
    @final_content = " "

    data = Nokogiri::HTML(open(url))
    contents = data.css("html")
    contents.each do |content|
      @h1_title = content.css("h1").text.strip
      @paragraph = content.css("p").text.strip
    end

    @final_content = @h1_title + @paragraph

    array = Array.new
    array = @final_content.split(" ")
    return array
  end
end
