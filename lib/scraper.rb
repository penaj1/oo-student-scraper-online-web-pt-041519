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
    page = Nokogiri::HTML(open(profile_url))
    
    students_hash = {}
    
    page.css("div.social-icon-container a").each do |social_links|
      if social_links["href"].include? "twitter"
        students_hash[:twitter] = social_links['href']
      elsif social_links["href"].include? "linkedin"
        students_hash[:linkedin] = social_links['href']
      elsif social_links["href"].include? "github"
        students_hash[:github] = social_links['href']
      else
        students_hash[:blog] = social_links['href']
    end
  end
  students_hash[:profile_quote] = page.css("div.profile-quote").text
  students_hash[:bio] = page.css("div.description-holder p").text
  students_hash
  end

end
