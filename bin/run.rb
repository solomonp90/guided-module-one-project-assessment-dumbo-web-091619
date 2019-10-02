require_relative '../config/environment'
# interface = Interface.new
# loggedin = interface.welcome()

# while loggedin.nil? 
#     loggedin = interface.welcome
# end

# interface.user = loggedin
# interface.user.main_menu




cli = CommandLineInterface.new

cli.run


