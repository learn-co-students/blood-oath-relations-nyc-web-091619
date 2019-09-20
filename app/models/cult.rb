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

  def self.least_popular
    self.all.min_by {|cult| cult.cult_population}
  end

  def self.most_common_location
    locs = self.all.map {|cult| cult.location }
    loc_count = {}
    locs.each do |loc|
      loc_count[loc] = 0 unless loc_count[loc]
      loc_count[loc] += 1
    end
    loc_count.max_by {|city, count| count}[0]
  end

  # Instance methods
  def recruit_follower(follower)
    @followers << follower
  end

  def cult_population
    self.followers.count
  end

  def average_age
    binding.pry
    age_sum = self.followers.map{|follower| follower.age}.reduce{|sum, age| sum + age}
    avg = (age_sum / self.cult_population)
  end

  def my_follower_mottos
    puts self.followers.map {|follower| follower.life_motto}
  end


end