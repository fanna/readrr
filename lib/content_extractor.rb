require 'open-uri'

class ContentExtractor
  def initialize(url)
    @url = url
  end

  def extract
    download_page
    parse_page
    extract_content
  end

  private

  def download_page
    @page = open(@url)
  end

  def parse_page
    @parsed_page =  Nokogiri::HTML(@page)
  end

  def extract_content
    html_content = @parsed_page.css("html")

    h1_title = " "
    paragraphs = " "

    html_content.each do |content|
      h1_title = content.css("h1").text.strip
      paragraphs = content.css("p").text.strip
    end

    content = h1_title + paragraphs
    content.split(" ")
  end
end
