require 'pry'
class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    @name = name
    student_hash.each do |key, value|
      self.send("#{key}"= )
  end

  def self.create_from_collection(students_array)
  end

  def add_student_attributes(attributes_hash)
  end

  def self.all
    @@all
  end
  
end
