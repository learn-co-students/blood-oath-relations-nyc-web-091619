class BloodOath

    attr_accessor :follower, :cult
    attr_reader :initiation_date # A String that is the initiation date of this blood oath in the format YYYY-MM-DD.

    @@all = []

    def initialize(follower, cult, date)
        @follower = follower
        @cult = cult
        @initiation_date = date
        @@all << self
    end

    def self.all
        @@all
    end

end
