class BloodOath
  attr_reader :initiation_date, :follower, :cult
  
  @@all = []

  # Class Methods
  def initialize(cultist, cult, initiation_date)
    @cultist = cultist
    @cult = cult
    @initiation_date = initiation_date
    
    @@all << self
  end

  def self.initiate(follower, cult, initiation_date)
    follower.join_cult(cult)
    cult.recruit_follower(follower)
    self.new(follower, cult, initiation_date)
    # binding.pry
  end

  def self.all
    @@all
  end

  # Instance methods


  
end