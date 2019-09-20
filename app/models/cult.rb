require 'date'

class Cult

    attr_reader :name, :founding_year
    attr_accessor :location, :slogan, :min_age

    @@all = []
    
    def initialize(name, location, slogan, founding_year, min_age)
        @name = name
        @location = location
        @slogan = slogan
        @min_age = min_age
        @founding_year = founding_year
        @@all << self
    end

    def recruit_follower(follower)
        if follower.age >= self.min_age
            BloodOath.new(follower, self, DateTime.now.strftime("%YYYY/%MM/%DD"))
        else
            puts "Sorry, you are too young. Come back in a few years!"
        end
    end # takes in an argument of a Follower instance and adds them to this cult's list of followers
    
    def my_blood_oaths
        BloodOath.all.select { |oath| oath.cult == self }
    end

    def my_followers
        my_blood_oaths.map {|oath| oath.follower}
    end

    def cult_population
        my_followers.length
    end # returns a Fixnum that is the number of followers in this cult

    def average_age
        total = 0
        my_followers.each {|follower| total += follower.age}
        total / cult_population
    end # returns a Float that is the average age of this cult's followers

    def my_followers_mottos
        my_followers.map {|follower| follower.life_motto}
    end # prints out all of the mottos for this cult's followers

    def self.all
        @@all
    end # returns an Array of all the cults

    def self.least_popular
        all.min_by {|cult| cult.cult_population} 
    end # returns the Cult instance who has the least number of followers :(

    def self.find_by_name(name)
        all.find { |cult| cult.name == name}
    end # takes a String argument that is a name and returns a Cult instance whose name matches that argument
    
    def self.find_by_location(location)
        all.find { |cult| cult.location == location}
    end # takes a String argument that is a location and returns an Array of cults that are in that location
    
    def self.find_by_founding_year(year)
        all.find { |cult| cult.founding_year == year }
    end # takes a Fixnum argument that is a year and returns all of the cults founded in that year

    def self.most_common_location
    end# returns a String that is the location with the most cults

end # End of the Cult class