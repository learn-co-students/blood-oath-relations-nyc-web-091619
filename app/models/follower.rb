class Follower

    attr_accessor :name, :age, :life_motto
    
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
        
    end

    def self.all
        @@all
    end

    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(self,cult)
        else
            puts "Sorry, you are not yet old enough to join the cult of #{cult.name}."
    end
    

    def self.of_a_certain_age(age)
        #Look through the followers
        #
        self.all.select do |follower|
            follower.age == age
        end

    end

end


# * `Follower.of_a_certain_age`
#   * takes a `Fixnum` argument that is an age and returns an `Array` of followers who are the given age or older