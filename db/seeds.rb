    5.times do
     User.create(name: Faker::Name.name)
    end
     u1 = User.first
     u2 = User.second
     u3 = User.third
     u4 = User.fourth
     u5 = User.fifth

    5.times do
     School.create(name: Faker::University.name)
    end
     sc1 = School.first
     sc2 = School.second
     sc3 = School.third
     sc4 = School.fourth
     sc5 = School.fifth

    5.times do
     Review.create(user_id: User.all.sample.id, school_id: School.all.sample.id, content: Faker::Hacker.say_something_smart)
    end
     rv1 = Review.first
     rv2 = Review.second
     rv3 = Review.third
     rv4 = Review.fourth
     rv5 = Review.fifth
       
    














# ===================================================================================================
#user instances

#     User.create(name: Faker::Name.name)


#   u2 = User.second
#   u3 = User.third

# ================================================================================================

#school instances

#      School.create(name: Faker::University.name)

    #   sc2 = School.second
    #   sc3 = School.third



# ===========================================================================================================================================

#review instances

# Review.create(user_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, content: Faker::Hacker.say_something_smart)

# Review.create(user_id: User.all.sample.id, school_id: School.all.sample.id, content:"these are the best schools!" )

# Review.create(user_id: User.all.sample.id, school_id: School.all.sample.id, content: Faker::Hacker.say_something_smart)

# Faker::Restaurant.review

# Faker::University.review

# rv1 = Review.first
# rv2 = Review.second





#     User.create(name: Faker::Name.name,username: Faker::Name.first_name)


 #<Review:0x00007facc050d9e8
#  id: 6,
#  school_id: 5,
#  user_id: 4,
#  content: "I'll synthesize the multi-byte XML bus, that should sensor the XSS pixel!">
#  North Sawayn

