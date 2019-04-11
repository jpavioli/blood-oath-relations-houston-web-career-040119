# **`Cult`**

class Cult

  attr_accessor :name, :location, :founding_year, :slogan
  attr_reader :followers, :minimum_age
  # Cult#name - returns a `String` that is the cult's name
  # Cult#location - returns a `String` that is the city where the cult is located
  # Cult#founding_year - returns a `Fixnum` that is the year the cult was founded
  # Cult#slogan - returns a `String` that is this cult's slogan

  @@all = []

  def initialize (name,location,founding_year,slogan)

    @name = name.to_str
    @location = location.to_str
    @founding_year = founding_year.to_i
    @slogan = slogan.to_str
    @@all << self
  end

  def followers
    #returns the instance of all followers
    arr = BloodOath.all.select{|blood_oath| blood_oath.cult == self}
    arr.map {|blood_oath| blood_oath.follower}
  end

  def cult_population
    #returns a `Fixnum` that is the number of followers in this cult
    BloodOath.all.count {|blood_oath| blood_oath.cult == self}
  end

  def self.find_by_name(name)
    #takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument
    self.all.select {|cult| cult.name == name}
  end

  def self.find_by_location(location)
    #takes a `String` argument that is a location and returns an `Array` of cults that are in that location
    self.all.select {|cult| cult.location == location}
  end

  def self.find_by_founding_year(year)
    #takes a `Fixnum` argument that is a year and returns all of the cults founded in that year
    self.all.select {|cult| cult.founding_year == year}
  end

  def average_age
    #returns a Float that is the average age of this cults followers
    self.followers.inject(0.0){ |sum, follower| sum + follower.age } / self.followers.size
  end

  def minimum_age
    #returns a fixnum for the minimum age required for followers joining this cult
    # arr = BloodOath.all.select {|blood_oath| blood_oath.cult == self}
    self.followers.min_by {|follower| follower.age}.age
  end

  def recruit_follower(follower)
    #takes in an argument of a `Follower` instance and adds them to this cult's list of followers
    #NOW this is changed such that if the given Follower instance is not of age:
    #   do not let them join the cult
    #   print out a friendly message informing them that they are too young
    if self.followers.count == 0
      BloodOath.new(follower,self,Time.now)
    elsif self.minimum_age <= follower.age
      BloodOath.new(follower,self,Time.now)
    else
      puts "We are sorry, you are too young to join our community"
    end
  end

  def my_follower_mottos
    #prints out all of the mottos for this cult's followers
    self.followers.each {|member| puts member.life_motto}
    nil
  end

  def self.least_popular
    #returns the cult instance who has the least number of followers :(
    self.all.min_by {|cult| cult.cult_population}
  end

  def self.most_common_location
    #returns a String that is the location with the most cults
    arr = self.all.map{ |cult| cult.location }
    arr.max_by {|location| arr.count(location)}
  end

  def self.all
    #returns an `Array` of all the cults
    @@all
  end

end
