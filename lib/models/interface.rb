class CommandLineInterface
    #the macro below gives us the ability to read out the prompt method
    attr_reader :prompt
    #the macro below gives the CLI class user reader and writer methods
     attr_accessor :user
    #the method below initializes instances with a prompt method when needed? #foggy
     def initialize
       @prompt = TTY::Prompt.new
     end
    #the method below greets a user and prompts them for a selection to the question stated in the prompt
    #wich in turn points the user to class methods written in the user.rb file
    def greet
        puts 'Welcome to the school review app, the best resource for school information in the world!'
        @prompt.select("Are you a returning user or a new user?") do |menu|
        menu.choice "Returning User", -> {  User.handle_returning_user }
        menu.choice "New User", -> { User.handle_new_user }
      end
    end


  #the method below is a instance method that takes in an object that is an array of objects/instances
#    of the School class as an argument
    def show_reviews(school)
        #the code below takes a school object from the array and pulls out the review stored in it , iterates through
        #and prints out the review objects name and content

      ##the school array object is being generated/grabbed from the "enter_school_name_prmpt" method  ##foggy

        school.reviews.each do |review|
             p review.user.name 
             p review.content
          end
          #the prompt menu points to instance methods written in the interface.rb file
          @prompt.select("would you like to do today?") do |menu|
            menu.choice "I would like to create a review", -> {self.write_review(user,school) }
            menu.choice "I would like to read reviews", -> { self.enter_school_name_prmpt }
            menu.choice "I would like to update a review" , -> {self.update_review(user,school)}
            menu.choice "I would like to delete a review", -> {self.delete_review(user,school)}
            menu.choice "I would like to logout", -> { `open https://www.google.com/` } 
          end     
    end


    #the method below takes in two objects as arguments 
    # still kind of foggy on if the school object is being generated/grabbed from the "enter_school_name_prmpt" method but
    #when a review is created it needs a user and it needs a school,i believe the params arguments refer to both

    def write_review(user,school)
        puts "please enter your review"
        user_review_input = gets.chomp
   #in order to create a review that pertains to particular user and school instance ive written the code below
        new_review = Review.create( user_id: user.id ,school_id: school.id ,content:user_review_input)
        
        puts "Thanks for leaving a review!"
   
        @prompt.select("If you would like to update/edit or delete your review select the following options") do |menu|
            menu.choice "Update/Edit", -> { self.update_review(user,school) }
            menu.choice "Delete", -> { self.write_review } 
            menu.choice "return to main menu",-> {self.enter_school_name_prmpt}
            menu.choice "logout",-> {`open https://www.google.com/`}
          end
    end
#i believe that in order to delete a review that pertains to a particular user i passed in the arguments
#of user and school into this methods params##slight fog##i did that to get access to a users ID and a schools ID
    def delete_review(user,school)
        #the "usersreviews" variable captures the reviews that relate to the user who wants to see them
        #and returns an array...see below
       usersreviews = Review.all.select { |review| review.user_id == user.id  }
#=======================================================================================================
       # the "users_content" variable captures the "usersreviews" variable wich is equal to an array
       # and iterates through it capturing each review and tells it to read out the content of each review
       users_content = usersreviews.each { |review|  p review.content }
#=======================================================================================================
#   Below i then prompt the user to select or copy the content of a review they would like to delete and enter
#   the content into the prompt  
       puts "Your reviews are listed above please enter the content you would like to delete"
       users_content_choice_to_delete = gets.chomp
#=====================================================================================================  
# the "content_to_delete" var refers to their selection of a review they'd like to delete 
       content_to_delete = Review.find_by(content:users_content_choice_to_delete)
 #  =================================================================================================    
       content_to_delete.destroy
       puts "Your review has been deleted"
       @prompt.select("please select an option to continue or logout") do |menu|
       menu.choice "continue", -> { self.enter_school_name_prmpt }
       menu.choice "logout", -> { `open https://www.google.com/` } 
       end
    end

#================================================================================================================
#the method below like some above it has arguements that i believe refer to a particular users reviews stored in the database

    def update_review(user,school)  
# the "usersreviews" var iterates through all reviews and returns an array of reviews that match the users ID 
       usersreviews = Review.all.select { |review| review.user_id == user.id  }
#=============================================================================================================       
       users_content = usersreviews.each { |review|  p review.content }
# "users_content"  var captures a particular users reviews and prints out the content of each review
#========================================================================================================== 

# i then prompt the user to select the content of the review they want to update and have them enter it to search 
#for that review in the database and return it so that it can then be updated
       puts "Your reviews are listed above please enter the content you would like to update"
       users_content_choice = gets.chomp
       puts "please enter your revision"
       content_to_change = Review.find_by(content:users_content_choice)
       updated_input = gets.chomp
       content_to_change.update(content:updated_input)
 #====================================================================================      
       puts "Your review has been updated"
       @prompt.select("please select an option to continue or logout") do |menu|
       menu.choice "continue", -> { self.enter_school_name_prmpt }
       menu.choice "logout", -> { `open https://www.google.com/` } 
      end    
    end

#===================================================================================================================

    def enter_school_name_prmpt
        puts " These are our current school listings"
        #the code below utilizes the relationship established between classes in the macros to grab
        #  all instances
        #of a school.the reason i can call .all , and .map is because active record macros contain these methods
        
        school_listings = School.all.map { |school| school.name   }
        p school_listings
        puts "Enter a school name to get started"
        school_name_input = gets.chomp
        name_of_school = School.find_by(name:school_name_input)
        show_reviews(name_of_school)     
    end

#========================================================================================================================================================

    def run
        self.user = greet       
        puts "If your search for a school has ended but youd like to get more information about your choice you've come to the right place!"
        enter_school_name_prmpt             
    end
end
