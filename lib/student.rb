require 'pry'
class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    @name = name
    student_hash.each do |key, value|
      self.send("#{key}=", value )
    end 
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each do |el|
      self.new(el)
    end
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |new_student|
      new_student << att

  end

  def self.all
    @@all
  end
  
end
