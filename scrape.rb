require 'open-uri'
require 'nokogiri'

class Scrape
  def initialize(keyword)
    html_doc = open("http://www.epicurious.com/tools/searchresults?search=#{keyword}")
    @html_file = Nokogiri::HTML(html_doc)
    @titles = []

  end

  def get_titles
    @html_file.css(".recipeLnk").each do |recipe|
      title = recipe.text
      link = recipe.attribute("href")
      @titles << {title: title, link: link}
    end
    @titles
  end

  def get_recipe(index)
    html_doc = open("http://www.epicurious.com/#{@titles[index][:link]}")
    @html_recipe = Nokogiri::HTML(html_doc)
    self
  end

  def get_description
    @html_recipe.css(".dek").text
  end

  def get_rating
    @html_recipe.css(".rating").text
  end
end
