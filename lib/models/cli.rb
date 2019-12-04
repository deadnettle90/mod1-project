class Cli

def self.welcome
    puts "Hello, what is your name?"
    # binding.pry
    @user_name = gets.chomp
    puts "Welcome #{@user_name}!"
end

def self.start_menu
    puts "Choose something you would like to do with your time in Denver"
end

end