class CreateSchools < ActiveRecord::Migration[5.2]
  def change
   create_table :schools do |t|
    t.string :name
   end
  end
end

# mings_garden = Restaurant.create(name: "Ming's Garden")
# Review.create(user_id: mike.id, restaurant_id: mings_garden.id, content: "My favorite take out place!")
 
# mike.reviews # What does this return?
# mike.restaurants # What does this return?