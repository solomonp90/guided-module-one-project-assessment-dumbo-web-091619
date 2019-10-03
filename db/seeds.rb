    # ===================================================================================================
#user instances generated by faker gem
    5.times do
     User.create(name: Faker::Name.name)
    end
     u1 = User.first
     u2 = User.second
     u3 = User.third
     u4 = User.fourth
     u5 = User.fifth

# ================================================================================================

#school instances generated by faker gem
    5.times do
     School.create(name: Faker::University.name)
    end
     sc1 = School.first
     sc2 = School.second
     sc3 = School.third
     sc4 = School.fourth
     sc5 = School.fifth
# ===========================================================================================================================================

#review instances generated by faker gem
    5.times do
     Review.create(user_id: User.all.sample.id, school_id: School.all.sample.id, content: Faker::Hacker.say_something_smart)
    end
     rv1 = Review.first
     rv2 = Review.second
     rv3 = Review.third
     rv4 = Review.fourth
     rv5 = Review.fifth
       