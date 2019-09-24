class Follower
    attr_accessor
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, 
                    life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        BloodOath.all.select{|oath|oath.follower == self}
    end

    def join_cult(date, cult)
        BloodOath.new(date, cult, self)
    end

    def Follower.of_a_certain_age(age)
        self.all.select{|follower|follower.age >= age}
    end

    def self.all
        @@all
    end

 ############ Analytic Methods##################

    def my_cults
        BloodOath.all.select{|blood_oath| blood_oath.follower == self}
    end   

    def my_cults_slogan
        my_cults.map{|blood_oath|blood_oath.cult.slogan}
    end

    def Follower.most_active
        BloodOath.all.map{|blood_oath|blood_oath.follower}
            .each_with_object(Hash.new(0)){|follower, counts|counts[follower] +=1}
            .sort_by{|k,v|-v}[0][0].name
    end 

    # #backgroud behind this method
    # [:foo, :bar, :jazz].each_with_object({}) do |item, hash|
    #     hash[item] = item.to_s.upcase
    #   end
    #    => {:foo=>"FOO", :bar=>"BAR", :jazz=>"JAZZ"}


    # def Follower.top_ten
    #     BloodOath.all.map{|blood_oath|blood_oath.follower}
    #         .each_with_object(Hash.new(0)){|follower, count|count[follower] +=1}
    #         .sort_by{|k, v| -v}.flatten.max_by(10){|x| x}


    #         #.map{|follower|follower[0]}
            
    # end



    # def Follower.top_ten
    #     BloodOath.all.max_by(10) do |follower|
    #         binding.pry
    #         [follower.cult].size
    #     end
    # end

    def self.top_ten
        all.max_by(10) do |follower|
            follower.cults.size
        end
    end

    










end #end of Follower class