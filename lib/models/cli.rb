class Cli

attr_reader :user

    def welcome
        puts "Hey hey! What can we call you by?"
        user_input = gets.chomp
        puts "Hi #{user_input}. Welcome to our Colorado Brewery Guide!"
        @user = User.create(name: user_input)
    end

    def brewery_by_city(arg)
        Brewery.all.select do |brewery|
            brewery[:location] == arg
        end
    end

    def store_city
        prompt = TTY::Prompt.new
        selection = prompt.select("Start by selecting a city to your profile", ["Boulder", "Breckenridge", "Colorado Springs", "Denver", "Durango", "Fort Collins", "Steamboat Springs", "Telluride", "I don't see the city I'm looking for"])
        if brewery_by_city(selection)
            @user[:preferred_city] = selection
            puts "Great, we have found some breweries in #{selection}."          
        elsif selection == "I don't see the city I'm looking for"
        prompt.ask("Type in your city")
        city_entry = gets.chomp.capitalize
            if brewery_by_city(city_entry)
                @user[:preferred_city] = city_entry
            else
                puts "Sorry, we don't have any breweries in the city you selected.."
                select_city
            end
        end
        select_type
    end 
     
    def brewery_by_type(city_choice, brewery_type_choice)
        brewery_by_city(city_choice).select do |brewery| 
            brewery[:brewery_type] == brewery_type_choice    
        end
    end    

    def select_type
        prompt = TTY::Prompt.new
        type_selected = prompt.select("What type of brewery are you looking for?", ["Brewpub", "Micro", "Planning", "Regional"]) 
        
        list = brewery_by_type(@user[:preferred_city], type_selected.downcase)
        puts "Here is our recommendation: #{list}"
    end

end