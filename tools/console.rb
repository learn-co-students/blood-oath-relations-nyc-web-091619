require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


c1 = Cult.new("Flatiron", "NY", 2001, "You can do it!")
c2 = Cult.new("macys", "NJ", 1898, "do it!")
c3 = Cult.new("JC Penny", "CT", 1992, "You do it!")
c4 = Cult.new("JC Penny", "CT", 1992, "You do it!")

bob = Follower.new("Bob", 27, "Hell Yeah")
rob = Follower.new("Rob", 32, "woah")
sal = Follower.new("Sal", 67, "hiya")

bo1 = BloodOath.new(c1, bob, "2019-09-12")
bo2 = BloodOath.new(c2, rob, "2019-09-11")
bo3 = BloodOath.new(c3, sal, "2019-09-10")
bo4 = BloodOath.new(c3, bob, "2019-09-20")

# c3.cult_population
# Cult.find_by_name("Bob")
# Cult.find_by_location("NY")
# Cult.find_by_founding_year(1992)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
