class User < ActiveRecord::Base
    has_many :reviews

    has_many :schools ,through: :reviews
     @@prompt = TTY::Prompt.new

    def self.handle_new_user
        puts "What is your name?"
        name = gets.chomp
        user = User.create(name: name)
        user
      end

      def self.handle_returning_user
        puts "Welcome back! please enter your name"
        name = gets.chomp
        user = User.find_by(name: name)
        if user.nil?
            puts "Couldn't find a user with that name"
            puts "But lets get you started anyway!"
            user = User.create(name: name)            
        end
        user
      end

      


# user = User.find_by(name: 'David')
# user.destroy

# find and delete all users named David
# User.destroy_by(name: 'David')

    #   def self.delete_review_menu
    #     @prompt.select("To delete your review select hit enter") do |menu|
    #         menu.choice "Delete", -> { self.delete_review }
    #       end
    #   end



    #   def update_edit_review
    #     @prompt.select("If you would like to update/edit or delete your review select the following options") do |menu|
    #         menu.choice "Update/Edit", -> { self.edit_update_review }
    #         menu.choice "Delete", -> { self.delete_review_menu } 
    #       end
    #   end




    #   def self.write_review()
    #     puts "please enter your review"
    #     user_review_input = gets.chomp
    #     binding.pry
    #     new_review = Review.create(content:user_review_input)
    #     puts "Thanks for leaving a review!"
    #     # update_edit_review
    # end

    # @prompt.select("If you would like to update/edit or delete your review select the following options") do |menu|
    #     menu.choice "Update/Edit", -> { self.edit_update_review }
    #     menu.choice "Delete", -> { self.delete_review_menu } 
    #   end



    # def self.enter_school_name_prmpt
    #     puts " These are our current school listings"
    #     school_listings = School.all.map { |school| school.name   }
    #     p school_listings

    #     puts "Enter a school name to get started"
    #     school_name_input = gets.chomp
    #       name_of_school = School.find_by(name:school_name_input)
    #       reviews = name_of_school.reviews
    #      show_reviews(reviews)
    # end



    #   def main_menu
    #     self.reload
    #     system "clear"
    #     puts "Welcome, #{self.name}!"
    #     @@prompt.select("What would you like to leave a review today?") do |menu|
    #       menu.choice "yes", -> { self.yes_response }
    #       menu.choice "no", -> {self.no_response}
    #       menu.choice "Log Out", -> { `open https://www.google.com/` }
    #     end
    #   end
      

    #   def yes_response(content)
    #       puts "Please enter your review"
    #       review = gets.chomp
    #       review = Review.create(content:content)
    #   end

    #   def no_response
    #       puts "Ok maybe some other time"
    #     #    @@prompt.select()
    #     main_menu
    #   end



















    #   def display_options
    #     myoptions = self.options.map { |option| {option.name => option.id} }
    #     if myoptions.size == 0
    #       myoptions = ["You don't have any options to display."]
    #     end
    #     @@prompt.select("Choose an option to see more information", myoptions)
    #     self.main_menu
    #   end

        
    #   def display_options
        
    #   end

    #   myTeams = self.teams.map { |team| {team.name => team.id} }
    #   if myTeams.size == 0
    #     myTeams = ["You don't have any teams to display."]
    #   end
    #   @@prompt.select("Choose a team to see more information", myTeams)
    #   self.main_menu

    # mike = User.create(name: "Mike")

end