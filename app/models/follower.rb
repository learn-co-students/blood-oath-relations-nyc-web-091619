class Follower

    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name,age,life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end 

    def self.all
        @@all
    end 

    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age > age
        end 
    end

    def join_cult (cult)
        Bloodoath.new(cult,self)
    end 

    def cult
        bloodoath.map do |cult|
            bloodoath.cult
        end
    end 



end #end of follower
