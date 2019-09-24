
class Cult

    attr_reader :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all
    end


    def recruit_follower(follower, initiation_date)
        BloodOath.new(self, follower, initiation_date)
    end

    def  my_bloodoaths
        BloodOath.all.select do |bo|
            bo.cult == self
        end
    end

    def cult_population
        #Get followers through BloodOath
        #Look at cults individually in BO class
        #Look at BloodOath's cults
        #Count BloodOath's followers
        my_bloodoaths.length
        #Look through all of BloodOath class
        #Look at BloodOath's follower
    end
    
    def self.find_by_name(person_name)
        my_cults_bloodoaths = BloodOath.all.select do |oath|
            oath.follower.name == person_name
        end
        my_cults_bloodoaths.map do |oath|
            oath.cult
        end
    end
# # * takes a `String` argument that is a name and returns a `Cult` instance whose name matches that argument

    def self.find_by_location(cult_location)
        self.all.select do |cult_object| #return cult object
            cult_object.location ==  cult_location #cult objects that are strings
        end
    end

    def self.find_by_founding_year(year)
        self.all.select do |cult|
            cult.founding_year == year
        end
    end

end
