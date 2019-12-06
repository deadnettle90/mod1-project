class Cli

attr_reader :user

    def welcome
        system("clear")
        puts "\n"
        puts "Hello, enter your name here."
        user_input = gets.chomp
        puts "Hey #{user_input}. Welcome to our Colorado Brewery Guide!"
        @user = User.create(name: user_input)
    end

    def brewery_by_city(arg)
        Brewery.all.select do |brewery|
            brewery[:location] == arg
        end
    end

    def store_city
        puts "\n"
        prompt = TTY::Prompt.new(active_color: :magenta)
        selection = prompt.select("Start by selecting a city for your profile", ["Boulder", "Breckenridge", "Colorado Springs", "Denver", "Durango", "Fort Collins", "Golden", "Steamboat Springs", "Telluride"], active_color: :magenta)
        if brewery_by_city(selection)
            @user[:preferred_city] = selection
            puts "Great, we have found some breweries in #{selection}."          
        end
        select_type
    end 
     
    def brewery_by_type(city_choice, brewery_type_choice)
        brewery_by_city(city_choice).select do |brewery| 
            brewery[:brewery_type] == brewery_type_choice    
        end
    end    

    def select_type
        system("clear")
        puts "\n"
        prompt = TTY::Prompt.new(active_color: :cyan)
        type_selected = prompt.select("What type of brewery are you looking for?", ["Brewpub", "Micro", "Planning", "Regional"])  
        @list = brewery_by_type(@user[:preferred_city], type_selected.downcase)
        if !type_selected
         puts "Sorry we couldn't find that type of brewery in this city, choose another"
         select_type
        end
        favorites
    end

    def name_list
        @list.map do |brewery|
            brewery.name
        end
    end

    def favorites
        system("clear")
        puts "\n"
        prompt = TTY::Prompt.new(active_color: :magenta)
        @favs = prompt.select("Here are the breweries we found for you, select your favorite", [name_list])
        user_choices
    end

    def brewery_selector(arg)
        @list.find do |brewery|
            brewery.name == arg
        end
    end

    def user_choices
        system("clear")
        puts "\n"
        brewery_info = UserBrewery.create(brewery: brewery_selector(@favs), user: @user) 
        @brewery_choice = brewery_info.brewery
        puts "Time to drink some beer!"
        puts "#{@brewery_choice.name} is at #{@brewery_choice.street} in #{@brewery_choice.location}, Colorado." 
        prompt = TTY::Prompt.new(active_color: :cyan)
       update_brewery = prompt.select("Menu",["Choose a different Brewery", "View Profile", "Exit"])
       if update_brewery == "Choose a different Brewery"
        favorites
       elsif update_brewery == "View Profile"
        profile
       else
        puts "Cheers! But remember, don't drink and code."
       end
    end

    def profile
        system("clear")
        puts "\n"
        puts "Profile Information"
        puts "\n"
        puts "#{@user.name} \n"
        puts "Preferred City: #{@user.preferred_city} \n"
        puts "Your Brewery: \n"
        puts "#{@brewery_choice.name}\n#{@brewery_choice.street}\n#{@brewery_choice.location}, Colorado\n" 
        puts "\n"
        menu
    end

    def brewery_info
        system("clear")
        puts "\n"
        puts "Brewery Information"
        puts "\n"
        puts "#{@brewery_choice.name}\nBrewery Type: #{@brewery_choice.brewery_type}\n#{@brewery_choice.street}\n#{@brewery_choice.location}, Colorado\n#{@brewery_choice.phone}\n"
        puts @brewery_choice.website_url
        puts "\n"
        menu
    end 
     
    def menu 
        prompt = TTY::Prompt.new(active_color: :magenta)
        change_profile = prompt.select("Options",["Change Name", "Update City", "View Brewery Info", "View Profile", "Exit"])
        if change_profile == "Update City"
            store_city
        elsif change_profile == "Change Name"
            puts "What's the new name?"
            new_name = gets.chomp
            @user.update(name: new_name)
            profile
        elsif change_profile == "View Brewery Info"
            brewery_info
        elsif change_profile == "View Profile"
            profile
        else
            puts "Goodbye"
        end
    end
end