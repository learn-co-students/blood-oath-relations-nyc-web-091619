require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
cult1 = Cult.new("Yo", "Berlin", 2019, "slogan",7)
cult2 = Cult.new("AKD", "Paris", 2014, "SSSSlogan",22)
cult3 = Cult.new("IOFLS", "Milano", 2009, "bhjgfkdls",14)

fwr1 = Follower.new("John", 21, "life_motto")
fwr2 = Follower.new("Alex", 202, "lifeto")
fwr3 = Follower.new("Sasha", 9, "living young")

bo1 = BloodOath.new(cult1, fwr3)
bo2 = BloodOath.new(cult2, fwr2)
bo3 = BloodOath.new(cult2, fwr1)
bo4 = BloodOath.new(cult3, fwr3)
bo5 = BloodOath.new(cult3, fwr3)
bo6 = BloodOath.new(cult3, fwr2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
