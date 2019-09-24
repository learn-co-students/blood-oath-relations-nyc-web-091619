
class Follower
    attr_reader :name
    attr_accessor :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def my_blood_oaths
        BloodOath.all.select{|blood_oath| blood_oath.follower == self}
    end
    def cults
        my_blood_oaths.map{|blood_oath| blood_oath.cult}
    end

    def join_cult(cult)
        if age >= cult.minimum_age
            BloodOath.new(cult, self)
        else
            puts "Sorry bro, you shall not pass!!!"
        end
    end

    def self.all
        @@all
    end

    def self.of_a_sertain_age(age)
        self.all.select{|follower| follower.age >= age}
    end

    def my_cults_slogans
        cults.each{|cult| puts "#{cult.slogan}"}
    end

    def self.most_cults
        followers_cults = self.all.map do |follower|
            {follower => follower.cults.length}
        end
        sorted_flwr_cults = followers_cults.sort_by{|follower, count| count}.reverse
        sorted_flwr_cults_array = sorted_flwr_cults.map{|hash| hash.keys} 
        return sorted_flwr_cults_array
    end

    def self.most_active
        self.most_cults[0]
    end

    def self.top_ten
        self.most_cults[0...9]
    end

    def fellow_cult_members
        Follower.all.select do |follower|
            follower.cults & self.cults != [] and follower != self
        end
    end

end#end of Follower class