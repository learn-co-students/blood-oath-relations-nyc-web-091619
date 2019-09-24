class Cult
    attr_accessor
    attr_reader :name, :location,
                :founding_year, :slogan

    @@all = []

    def initialize(name, location, 
                    founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def recruit_follower(date, follower)
        BloodOath.new(date, self, follower)
    end

    def my_followers
        BloodOath.all.select{|oath| oath.cult == self}
    end

    def cult_population
        my_followers.count
    end

    def Cult.find_by_name(name)
        self.all.find{|cult|cult.name == name}
    end

    def Cult.find_by_location(location)
        self.all.select{|cult|cult.location == location}
    end

    def Cult.find_by_founding_year(year)
        self.all.select{|cult|cult.founding_year == year}
    end

    def self.all
        @@all
    end

 ############ Analytic Methods##################
    def average_age
        (my_followers.map{|followers| followers.follower.age}
            .inject{|sum, n| sum + n}/cult_population).to_f
    end

    def my_followers_mottos
        my_followers.map{|followers| puts followers.follower.life_motto}
    end

    def Cult.followers_hash
        followers_hash = {}
        BloodOath.all.each do |cults|
            cults.cult.name
            if followers_hash[cults.cult.name]
                followers_hash[cults.cult.name] += 1
            else
                followers_hash[cults.cult.name] = 1
            end
        end
        followers_hash
        
    end

    def Cult.least_popular
        Cult.find_by_name(Cult.followers_hash.sort_by{ |k, v| v}[0][0])
    end

    def Cult.most_common_location
        followers_hash = {}
        BloodOath.all.each do |cults|
            cults.cult.location
            if followers_hash[cults.cult.location]
                followers_hash[cults.cult.location] += 1
            else
                followers_hash[cults.cult.location] = 1
            end
        end
        followers_hash.sort_by{|k,v|-v}[0][0]
        
    end

end #end of Cult class