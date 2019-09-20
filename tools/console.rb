require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

f1 = Follower.new("Mike", 30, "pitter patter")
f2 = Follower.new("Sam", 25, "no purpose")
f3 = Follower.new("Jenny", 17, "I love my mother")

c1 = Cult.new("Order of the Moth", "New York", 1990, "Must eradicate pantry moths")
c2 = Cult.new("Manny's boys", "SF", 2015, "boybands must be the only form of music")
c3 = Cult.new("Heck", "NOLA", 1992, "Catholics for stricter mouth control")
c4 = Cult.new("Sloop", "NOLA", 1991, "Slow your roll")

b1 = BloodOath.initiate(f1, c2, "2015-09-27")
b2 = BloodOath.initiate(f1, c1, "1995-03-12")
b3 = BloodOath.initiate(f3, c3, "2000-08-14")
b4 = BloodOath.initiate(f2, c3, "2001-02-24")
b5 = BloodOath.initiate(f1, c3, "2003-04-13")
b6 = BloodOath.initiate(f1, c1, "2003-04-13")
b7 = BloodOath.initiate(f2, c4, "2003-07-13")





binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
