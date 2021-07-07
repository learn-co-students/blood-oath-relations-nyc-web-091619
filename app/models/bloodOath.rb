class BloodOath
  attr_reader :initiation_date, :cultist, :cult
  
  @@all = []

  # Class Methods
  def initialize(cultist, cult, initiation_date)
    @cultist = cultist
    @cult = cult
    @initiation_date = initiation_date
    
    @@all << self
  end

  def self.all
    @@all
  end

  def self.first_oath
    sorted = self.all.sort_by {|bo| bo.initiation_date}
    sorted.first
  end

  # Instance methods


  
end