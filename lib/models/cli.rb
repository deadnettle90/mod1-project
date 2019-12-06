class Cli

attr_reader :user

    def welcome
        puts "Hello, please enter your name here."
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
        prompt = TTY::Prompt.new(active_color: :magenta)
        selection = prompt.select("Start by selecting a city to your profile", ["Boulder", "Breckenridge", "Colorado Springs", "Denver", "Durango", "Fort Collins", "Steamboat Springs", "Telluride"], active_color: :magenta)
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
        prompt = TTY::Prompt.new(active_color: :cyan)
        type_selected = prompt.select("What type of brewery are you looking for?", ["Brewpub", "Micro", "Planning", "Regional"]) 
        
        @list = brewery_by_type(@user[:preferred_city], type_selected.downcase)
        favorites
    end

    def name_list
        @list.map do |brewery|
            brewery.name
        end
    end

    def favorites
        prompt = TTY::Prompt.new(active_color: :magenta)
        @favs = prompt.select("Here are the breweries we found for you, select your favorites", [name_list])
        user_choices
    end

    def brewery_selector(arg)
        @list.find do |brewery|
            brewery.name == arg
        end
    end

    def user_choices
        brewery_info = UserBrewery.create(brewery: brewery_selector(@favs), user: @user)
        puts "Go drink some beer! #{brewery_info.brewery.name} can be found in #{brewery_info.brewery.location}" 
        prompt = TTY::Prompt.new(active_color: :cyan)
       update_brewery = prompt.select("Would you like to pick another brewery?",["yes", "no"])
       if update_brewery == "yes"
        favorites
       else
        puts "Cheers! But remember, don't drink and code."
       end
    end

end