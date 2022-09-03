class Actor < ActiveRecord::Base
    has_many :roles 
    has_many :movies, through: :roles

    def total_salary
        self.roles.map{|role| role.salary}.sum
    end

    def blockbusters
        self.movies.where("movies.box_office_earnings > ?", 50_000_000)
    end

    def self.most_successful
        Actor.all.max_by {|actor| actor.total_salary}
    end
end