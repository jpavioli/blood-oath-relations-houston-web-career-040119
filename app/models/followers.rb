# **`Follower`**

class Follower

  attr_accessor :name, :age, :life_motto
  # Follower#name - returns a `String` that is the follower's name
  # Follower#age - returns a `Fixnum` that is the age of the follower
  # Follower#life_motto - returns a `String` that is the follower's life motto

  @@all = []

  def initialize (name,age,life_motto)
    @name = name.to_str
    @age = age.to_i
    @life_motto = life_motto.to_str
    @@all << self
  end

  def cults
    #returns an `Array` of this follower's cults
    arr = BloodOath.all.select {|blood_oath| blood_oath.follower == self}
    arr.map {|blood_oath| blood_oath.cult}
  end

  def number_of_cults
    #returns the total number of cults this follower has joined
    self.cults.count
  end

  def join_cult(cult)
    #takes in an argument of a `Cult` instance and adds this follower to the cult's list of followers
    #NOW this is changed such that if you don't meet the minimum age requirement of the given Cult instance:
    #   do not let them join the cult
    #   print out a friendly message informing them that they are too young
    if cult.followers.count == 0
      BloodOath.new(self,cult,Time.now)
    elsif cult.minimum_age <= self.age
      BloodOath.new(self,cult,Time.now)
    else
      puts "We are sorry, you are too young to join our community"
    end
  end

  def self.of_a_certain_age(age)
    #takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older
    self.all.select {|follower| follower.age == age}
  end

  def my_cults_slogans
    #prints out all of the slogans for this follower's cults
    self.cults.each {|cult| puts cult.slogan}
    nil
  end

  def self.most_active
    #returns the follower instance who has joined the most cults
    self.all.max_by {|follower| follower.number_of_cults}
  end

  def self.top_ten
    #returns an array of followers; they are the ten most active followers
    self.all.sort {|follower_a,follower_b| follower_b.number_of_cults <=> follower_a.number_of_cults}.take(10)
  end

  def fellow_cult_members
    #returns a unique array of followers who are in the same cult as you
    #Create an array of BoodOaths that match my cults (assuming that I dont want to know I am in the list)
    arr = BloodOath.all.select {|blood_oath| self.cults.include?(blood_oath.cult) && blood_oath.follower != self}
    arr.map {|blood_oath| blood_oath.follower}.uniq
  end

  def self.all
    #returns an `Array` of all the followers
    @@all
  end

end
