class Cult
    attr_reader :name, :founding_year
    attr_accessor :location, :slogan, :minimum_age

    @@all = []

    def initialize(name, location, founding_year, slogan, minimum_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age
        @@all << self
    end

    def recruit_follower(follower)
        if follower.age >= minimum_age
            BloodOath.new(self, follower)
        else 
            puts "You shall not pass!!!"
        end
    end

    def my_blood_oaths
        BloodOath.all.select{|blood_oath| blood_oath.cult == self}
    end

    def cult_population
        my_blood_oaths.length
    end

    def self.all
        @@all
    end

    def self.find_by_name(lookup_name)
        self.all.find{|cult| cult.name == lookup_name}
    end

    def self.find_by_location(location)
        self.all.select{|cult| cult.location == location}

    end

    def self.find_by_founding_year(founding_year)
        self.all.select{|cult| cult.founding_year == founding_year}
    end

    def average_age
        sum_age = 0.0
        sum_age_arr = my_blood_oaths.map{|blood_oath| blood_oath.follower.age if blood_oath.cult == self}
        sum_age = sum_age_arr.inject { |sum, n| sum + n }
        sum_age/cult_population.to_f
    end

    def self.least_popular
        self.all.min_by{|cult| cult.cult_population}
    end

    def self.most_common_location
        cult_hash = {}
        BloodOath.all.each do |blood_oath|
            if !cult_hash[blood_oath.cult.location]    
                cult_hash[blood_oath.cult.location] = 1
            else
                cult_hash[blood_oath.cult.location] += 1
            end
        end
        cult_hash.sort_by{ |cult, count| count}.max_by{|key| key[1]}[0]

    end
    

end#end of Cult class