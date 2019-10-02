class CommandLineInterface
    attr_reader :prompt
     attr_accessor :user

     def initialize
       @prompt = TTY::Prompt.new
     end

    def greet
        puts 'Welcome to the school review app, the best resource for school information in the world!'
        @prompt.select("Are you a returning user or a new user?") do |menu|
        menu.choice "Returning User", -> {  User.handle_returning_user }
        menu.choice "New User", -> { User.handle_new_user }
      end
    end
  
    def show_reviews(school)
        
        school.reviews.each do |review|
             p review.user.name 
             p review.content
          end
          @prompt.select("would you like to do today?") do |menu|
            menu.choice "I would like to read reviews", -> { self.enter_school_name_prmpt }
            menu.choice "I would like to create a review", -> {self.write_review(user,school) }
            menu.choice "I would like to update a review" , -> {self.update_review(user,school)}
            menu.choice "I would like to delete a review", -> {self.delete_review(user,school)}
            menu.choice "I would like to logout", -> { `open https://www.google.com/` } 
          end     
    end

    def write_review(user,school)
        puts "please enter your review"
        user_review_input = gets.chomp
        
        new_review = Review.create( user_id: user.id ,school_id: school.id ,content:user_review_input)
        
        puts "Thanks for leaving a review!"

        @prompt.select("If you would like to update/edit or delete your review select the following options") do |menu|
            menu.choice "Update/Edit", -> { self.update_review(user,school) }
            menu.choice "Delete", -> { self.write_review } 
          end
    end

    def delete_review(user,school)
        usersreviews = Review.all.select { |review| review.user_id == user.id  }
       users_content = usersreviews.each { |review|  p review.content }
       puts "Your reviews are listed above please enter the content you would like to delete"
       users_content_choice_to_delete = gets.chomp
    #    puts "please enter your revision"
       content_to_delete = Review.find_by(content:users_content_choice_to_delete)
    #    deleted_input = gets.chomp
       content_to_delete.destroy
       puts "Your review has been deleted"


       @prompt.select("please select an option to continue or logout") do |menu|
        menu.choice "continue", -> { self.enter_school_name_prmpt }
        menu.choice "logout", -> { `open https://www.google.com/` } 
       end
    end



    def update_review(user,school)
    
       usersreviews = Review.all.select { |review| review.user_id == user.id  }
       users_content = usersreviews.each { |review|  p review.content }
       puts "Your reviews are listed above please enter the content you would like to update"
       users_content_choice = gets.chomp
       puts "please enter your revision"
       content_to_change = Review.find_by(content:users_content_choice)
       updated_input = gets.chomp
       content_to_change.update(content:updated_input)
       puts "Your review has been updated"


       @prompt.select("please select an option to continue or logout") do |menu|
        menu.choice "continue", -> { self.enter_school_name_prmpt }
        menu.choice "logout", -> { `open https://www.google.com/` } 
      end
       
    end


    def enter_school_name_prmpt
        puts " These are our current school listings"
        school_listings = School.all.map { |school| school.name   }
        p school_listings

        puts "Enter a school name to get started"
        school_name_input = gets.chomp
          name_of_school = School.find_by(name:school_name_input)
          show_reviews(name_of_school)
        
    end



    def run
        self.user = greet
        
        puts "If your search for a school has ended but youd like to get more information about your choice you've come to the right place!"

        enter_school_name_prmpt

                
    end
    
 # puts " These are our current school listings"
        # school_listings = School.all.map { |school| school.name   }
        # p school_listings

        # puts "Enter a school name to get started"
        # school_name_input = gets.chomp
        #   name_of_school = School.find_by(name:school_name_input)
        #   reviews = name_of_school.reviews
        #  show_reviews(reviews)

end


 # def try_again(reviews)
    #     puts "Enter a school name to get started"
    #     school_name_input = gets.chomp
    #       name_of_school = School.find_by(name:school_name_input)
    #       reviews = name_of_school.reviews
    #      show_reviews(reviews)
    # end


   # def handle_new_user
    #     puts "What is your name?"
    #     name = gets.chomp
    #     User.create(name: name)
        
    #   end

    #   def handle_returning_user
    #     puts "Welcome back! please enter your name"
    #     name = gets.chomp
    #     User.find_by(name: name)
    #     if name == name_of_school
    #         self.main_menu
    #     end
    #   end


    #   def yes_response(content)
    #     puts "Please enter your review"
    #     review = gets.chomp
    #     review = Review.create(content:content)
    # end

    # def no_response
    #     puts "Ok maybe some other time"
    #   #    @@prompt.select()
    #   main_menu
    # end





# def main_menu
    #     self.reload
    #     system "clear"
    #     puts "Welcome, #{self.name}!"
    #     @@prompt.select("What would you like to leave a review today?") do |menu|
    #       menu.choice "yes", -> { self.yes_response }
    #       menu.choice "no", -> {self.no_response}
    #       menu.choice "Log Out", -> { `open https://www.google.com/` }
    #     end
    #   end






# class Interface
#     attr_reader :prompt
#     attr_accessor :user
  
#     def initialize
#       @prompt = TTY::Prompt.new
#     end
  
#     def welcome
#       puts "Hello, welcome to the hero application."
  
#       @prompt.select("Are you a returning user or a new user?") do |menu|
#         menu.choice "Returning User", -> { User.handle_returning_user }
#         menu.choice "New User", -> { User.handle_new_user }
#       end
