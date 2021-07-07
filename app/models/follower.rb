class Follower
  attr_reader :name, :age, :life_motto

  @@all = []
  

  # Class methods
  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto

    @@all << self
  end

  def self.all
    @@all
  end

  def self.cult_count
    cult_count = {}
    self.all.each do |follower|
      cult_count[follower] = follower.cults.count
    end
    cult_count
  end

  def self.of_a_certain_age(num)
    self.all.select {|follower| follower.age >= num}
  end
  
  def self.most_active
    # binding.pry
    # self.all.each do |follower|
    #   @@cult_count[follower] = follower.cults.count
    # end
    self.cult_count.max_by{|follower, count| count}[0]
  end

  def self.top_ten
    sorted = self.cult_count.sort_by {|follower, count| count}
    sorted.first(10)
  end
  # Instance methods

  def blood_oaths
    BloodOath.all.select do |bo|
      bo.cultist == self
    end
  end

  def cults
    blood_oaths.map do |bo|
      bo.cult
    end
  end

  def join_cult(cult, initiation_date)
    BloodOath.new(self, cult, initiation_date) unless self.age < cult.minimum_age 
      "#{self.name} can't join #{cult.name} at this age!"
  end


  def my_cults_slogans
    puts self.cults.map {|cult| cult.slogan}
  end

  def fellow_cult_members
    array_of_names_per_cult = self.cults.map do |cult|
      cult.followers.map do |follower|
        follower.name
      end
    end
    
    array_of_names_per_cult.flatten.uniq.select do |name| # Sorry. 
      name != self.name
    end
  end

end