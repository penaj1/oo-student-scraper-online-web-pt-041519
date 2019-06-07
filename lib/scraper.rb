require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)

    page = Nokogiri::HTML(open(index_url))
    students = []
    
    page.css("div.student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css("a").attribute("href").value
      student_info = {:name => name,
                :location => location,
                :profile_url => profile_url}
      students << student_info
      end
    students
  end

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(index_url))
    
    students_hash = {}
    
    page.css("div.social-icon-container a").each do |social_links|
      if social_links["href"].include? "twitter"
        students_hash[:twitter] = social_link['href']
      elsif social_links["href"].include? "linkedin"
        students_hash[:linkedin] = social_link['href']
      elsif social_links["href"].include? "github"
        students_hash[:github] = social_link['href']
      else
        students_hash[:blog] = social_link['href']
    end
  end
end

end
