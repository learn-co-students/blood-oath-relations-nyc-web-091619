class BloodOath
    attr_accessor 
    attr_reader :cult, :follower

    @@all = []

    def initialize(date, cult, follower)
        @date = date
        @cult = cult
        @follower = follower
        @@all << self
    end

    def initiation_date
        @date
    end

    def self.all
        @@all
    end

 ############ Analytic Methods##################
end #end of BloodOath class                 