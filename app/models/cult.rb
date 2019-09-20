require 'date'

class Cult

    attr_reader :name, :founding_year
    attr_accessor :location, :slogan

    @@all = []
    
    def initialize(name, location, slogan, founding_year)
        @name = name
        @location = location
        @slogan = slogan
        @founding_year = founding_year
        @@all << self
    end

    def recruit_follower(follower)
        BloodOath.new(follower, self, DateTime.now.strftime("%YYYY/%MM/%DD"))
    end # takes in an argument of a Follower instance and adds them to this cult's list of followers
    
    def cult_population
        BloodOath.all.select { |oath| oath.cult == self }.length
    end # returns a Fixnum that is the number of followers in this cult
    
    def self.all
        @@all
    end # returns an Array of all the cults

    def self.find_by_name(name)
        all.find { |cult| cult.name == name}
    end # takes a String argument that is a name and returns a Cult instance whose name matches that argument
    
    def self.find_by_location(location)
        all.find { |cult| cult.location == location}
    end # takes a String argument that is a location and returns an Array of cults that are in that location
    
    def self.find_by_founding_year(year)
        all.find { |cult| cult.founding_year == year }
    end # takes a Fixnum argument that is a year and returns all of the cults founded in that year

end # End of the Cult class