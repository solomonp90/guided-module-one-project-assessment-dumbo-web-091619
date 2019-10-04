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


end