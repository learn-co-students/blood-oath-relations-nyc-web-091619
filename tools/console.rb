require_relative '../config/environment.rb'
require_relative '../app/models/BloodOath.rb'
require_relative '../app/models/Cult.rb'
require_relative '../app/models/Follower.rb'
require 'date'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
#Time.now.strftime("%Y/%m/%d")

#chanting = BloodOath.new("2015-09-08", "Vampire", "Vicky")
# p chanting

#Initialization of Cults
vampires = Cult.new("Vampires", "New York", 1981, "We drink blood")
warewolves = Cult.new("Warewolves", "New Jersey", 1985, "We howl at the moon")
sleepwalkers = Cult.new("Sleepwalkers", "New Jersey", 1987, "We never sleep")
bikers = Cult.new("Bikers", "New York", 2019, "We on 2s, bike life")

#Initialization of Followers
altaf = Follower.new("Altaf", 38, "Everything for the best")
nasr = Follower.new("Nasr", 34, "Dude where's my chicken")
salman = Follower.new("Salman", 32, "I do what I want")
mustafa = Follower.new("Mustafa", 32, "Drvie like you walk")

#Cult methods
vampires.recruit_follower(Time.now.strftime("%Y/%m/%d"), altaf)
bikers.recruit_follower(Time.now.strftime("%Y/%m/%d"), altaf)
bikers.recruit_follower(Time.now.strftime("%Y/%m/%d"), nasr)
bikers.recruit_follower(Time.now.strftime("%Y/%m/%d"), salman)
bikers.my_followers
bikers.cult_population
Cult.find_by_name("Warewolves")
Cult.find_by_location("New York")
Cult.find_by_founding_year(1981)
Cult.find_by_founding_year(2019)

#Follower Methods
nasr.cults
salman.join_cult(Time.now.strftime("%Y/%m/%d"), warewolves)
mustafa.join_cult(Time.now.strftime("%Y/%m/%d"), sleepwalkers)
mustafa.join_cult(Time.now.strftime("%Y/%m/%d"), warewolves)
mustafa.cults
Follower.of_a_certain_age(21)
Follower.all

#Advance Methods

#Cult Advanced
bikers.average_age
#bikers.my_followers_mottos
Cult.least_popular
Cult.most_common_location

#Follower Advanced
nasr.my_cults
salman.my_cults_slogan
Follower.most_active
p Follower.top_ten
#binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
