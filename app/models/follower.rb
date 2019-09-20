require 'date'

class Follower

    attr_reader :name, :age, :life_motto
    
    @@all = [] 

    def initialize(name, age, motto)
        @name = name
        @age = age
        @life_motto = motto
        @@all << self
    end

    def my_blood_oaths
        BloodOath.all.select do |oath|
            oath.follower == self
        end
    end

    def cults
        my_blood_oaths.map {|oath| oath.cult}
    end # returns an Array of this follower's cults

    def join_cult(cult)
        BloodOath.new(self, cult, DateTime.now.strftime("%YYYY/%MM/%DD"))
    end # takes in an argument of a Cult instance and adds this follower to the cult's list of followers

    def my_cults_slogans
        puts cults.map {|cult| cult.slogan}
    end # prints out all of the slogans for this follower's cults

    def self.all
        @@all
    end

    def self.most_active
        all.max_by {|follower| follower.cults.size}
    end # returns the Follower instance who has joined the most cults

    def self.top_ten
        all.max_by(10) {|follower| follower.cults.size}
    end # returns an Array of followers; they are the ten most active followers
  
    def self.of_a_certain_age(age_to_check)
        all.select {|follower| follower.age == age_to_check }
    end # takes a Fixnum argument that is an age and returns an Array of followers who are the given age or older

end