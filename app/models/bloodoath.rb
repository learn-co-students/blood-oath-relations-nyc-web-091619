require 'date'

class BloodOath
    attr_reader :initiation_date
    attr_accessor :cult, :follower

    @@all = []

    def initialize(cult, follower)
        @cult = cult
        @initiation_date = Date.today
        @follower = follower
        @@all << self
    end 

    def self.all
        @@all
    end

    def self.first_oath
        self.all[0].follower
    end

end#end of BloodOath class