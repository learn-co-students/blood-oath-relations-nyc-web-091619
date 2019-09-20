class Follower
  attr_reader :name, :age, :life_motto
  attr_accessor :cults

  @@all = []
  # Class methods
  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @cults = []

    @@all << self
  end

  def self.all
    @@all
  end
  def self.of_a_certain_age(num)
    self.all.select {|follower| follower.age >= num}
  end
  # Instance methods
  def join_cult(cult)
    self.cults << cult
  end
end