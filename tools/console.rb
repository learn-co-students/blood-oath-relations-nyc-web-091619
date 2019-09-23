require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# cults (name, location, slogan, founding_year, min_age)
c1 = Cult.new("c1", "NYC", "slogan 1", 1994, 18)
c2 = Cult.new("c2", "LA", "slogan 2", 1994, 50)
c3 = Cult.new("c3", "ATL", "slogan 3", 1994, 21)
c4 = Cult.new("c4", "DC", "slogan 4", 1994, 18)

#followers (name, age, motto)
f1 = Follower.new("Follower 1", 17, "motto 1")
f2 = Follower.new("Follower 2", 60, "motto 2")
f3 = Follower.new("Follower 3", 19, "motto 3")
f4 = Follower.new("Follower 4", 21, "motto 4")
f5 = Follower.new("Follower 5", 25, "motto 5")

#blood oaths (follower, cult, date)
b1 = BloodOath.new(f1, c1, "2019/09/23")
b1 = BloodOath.new(f2, c2, "2019/08/23")
b1 = BloodOath.new(f3, c3, "2019/07/23")
b1 = BloodOath.new(f4, c4, "2019/06/23")
b1 = BloodOath.new(f5, c1, "2019/05/23")


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
