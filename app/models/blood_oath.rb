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

    def self.first_oath
        all.min_by {|oath| oath.initiation_date}.follower
    end # returns the Follower instance for the follower that made the very first blood oath

    def self.all
        @@all
    end

end
