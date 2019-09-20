require 'date'

class Follower

    attr_reader :name, :age
    attr_writer :life_motto
    
    @@all = [] 

    def initialize(name, age, motto)
        @name = name
        @age = age
        @life_motto = motto
        @@all << self
    end

    def blood_oaths
        BloodOath.all.select do |oath|
            oath.follower == self
        end
    end

    def cults
        blood_oaths.map {|oath| oath.cult}
    end # returns an Array of this follower's cults

    def join_cult(cult)
        BloodOath.new(self, cult, DateTime.now.strftime("%YYYY/%MM/%DD"))
    end # takes in an argument of a Cult instance and adds this follower to the cult's list of followers

    def self.all
        @@all
    end
  
    def self.of_a_certain_age(age_to_check)

        all.select {|follower| follower.age == age_to_check }

    end # takes a Fixnum argument that is an age and returns an Array of followers who are the given age or older

end