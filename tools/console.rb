require_relative '../config/environment.rb'
require_relative '../app/models/cult.rb'
require_relative '../app/models/followers.rb'
require_relative '../app/models/blood_oath.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#create new followers
#initialize (name,age,life_motto)
f1 = Follower.new("Bob",21,"Hail Satain")
f2 = Follower.new("Drew",12,"F the Police")
f3 = Follower.new("Susan",13,"I am just here for the beer")
f4 = Follower.new("Baby Tim",1,"Goo goo ga ga")

#create new cults
#initialize (name,location,founding_year,slogan)
c1 = Cult.new("Satain Worshipers","Salem",1803,"Hail Satain")
c2 = Cult.new("CrossFit","San Diego",2006,"We are not a cult")
c3 = Cult.new("7th Day Adventests","Salem",1800,"Woo!")

#create new BloodOaths
#initialize (follower,cult,date)
b1 = BloodOath.new(f1,c1,Time.now)
b2 = BloodOath.new(f2,c1,Time.now)
b3 = BloodOath.new(f3,c1,Time.now)

#recriut follower
b4 = c2.recruit_follower(f2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
