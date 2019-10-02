class School < ActiveRecord::Base
    has_many :reviews
    has_many :users ,through: :reviews


    # def reviews
    #     Review.all
    # end



end


# mings_garden = Restaurant.create(name: "Ming's Garden")
# Review.create(user_id: mike.id, restaurant_id: mings_garden.id, content: "My favorite take out place!")
 
# mike.reviews # What does this return?
# mike.restaurants # What does this return?

# firstreview = Review.create(user_id: bob.id, school_id: skate_school.id, content: "The best skate school!")
