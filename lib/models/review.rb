class Review < ActiveRecord::Base
    belongs_to :school
    belongs_to :user

    # def self.display_options
    #     # options = ["Learn how to code","learn how to skate","learn how to play guitar"]
    #      @@prompt.select("options")do |menu|
    #      menu.choice "learn how to code",->{self.create(location: location,option: option)}
    #      menu.choice "learn how to skate",->{self.create(location: location,option: option)}
    #      menu.choice "learn how to play guitar",->{self.create(location: location,option: option)}
    # end

    # def method_name
        
    # end
    # t.string :location
    #   t.string :option

    # User.create(name: name, username: username)

    # end


    # def main_menu
    #     self.reload
    #     system "clear"
    #     puts "Welcome, #{self.name}!"
    #     @@prompt.select("What would you like to learn today?") do |menu|
    #     #   menu.choice "See options", -> { self.display_options }
    #       menu.choice "See options", -> { Meetup.display_options }
    #       menu.choice "Log Out", -> { `open https://www.google.com/` }
    #     end
    #   end

    # t.integer :instructor_id
    # t.integer :user_id
    # t.string :option
    # t.string :review

end