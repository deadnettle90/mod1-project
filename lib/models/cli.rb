class Cli

@cities = ["Boulder", "Breckenridge", "Colorado Springs", "Denver", "Durango", "Fort Collins", "Steamboat Springs", "Telluride", "Nah, let's try something else"]
@types = ["Brewpub", "Micro", "Planning", "Regional", "Nope, not this either"]

def self.welcome
    puts "Hey hey! What can we call you by?"
    user_input = gets.chomp
    puts "Hi #{user_input}. Welcome to our Colorado Brewery Guide!"
    @user = User.create(name: user_input)
end

def self.menu    
    prompt = TTY::Prompt.new
    choice = prompt.select("How would you like to find a brewery?", ["City", "Brewery Type", "I have a brewery in mind"])
    
end

def self.user_options
    prompt = TTY::Prompt.new
    prompt.ask("We've got a long list of breweries for you, take a look at our options below!")
    choice = prompt.select("How would you like to find one by?", ["City", "Brewery Type", "I have a brewery in mind"])
        if choice == "City"
        choice1 = prompt.select("City", [@cities])
            if choice1 == "Nah, let's try something else"
            menu
            elsif choice == "Brewery Type"
            choice2 = prompt.select("Brewery Type", [@types])
        elsif choice == "I have a brewery in mind"
        choice3 = prompt.ask("What's the name?")
            if choice3 == brewery["name"]
            puts "Ok, #{brewery[:name]} is at #{brewery[:street]} in #{brewery[:city]}. Enjoy!"
            else
            puts "We can't find a brewery based on your entry, try finding it by city.."
            end
        end
    end
end

end