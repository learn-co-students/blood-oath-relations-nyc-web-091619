class Cult
  attr_accessor :name, :location, :followers
  attr_reader :founding_year, :slogan

  @@all = []
  # Class methods
  def initialize(name=nil, location=nil, founding_year=nil, slogan=nil)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @followers = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.select {|kvlt| kvlt.name == name}
  end

  def self.find_by_location(place)
    # binding.pry
    self.all.select {|kvlt| kvlt.location == place}
  end

  def self.find_by_founding_year(year)
    self.all.select {|kvlt| kvlt.founding_year == year}  
  end
  # Instance methods
  def recruit_follower(follower)
    @followers << [follower]
  end

  def cult_population
    self.followers.count
  end
end