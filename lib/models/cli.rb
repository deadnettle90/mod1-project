class Cli

def self.welcome
    puts "Hey hey! What can we call you by?"
    @user_name = gets.chomp
    puts "Welcome, #{@user_name}, to our Denver Brewery Guide!"
end

# def breweries
#     UserBrewery.all.select do |brewery|
#         brewery.
#     end
# end

def self.user_options
    prompt = TTY::Prompt.new
    choice = prompt.select("How would you like us to recommend a brewery for you?", ["Happy Hour", "Location", "Food", "Customer Rating", "No, I have something in mind."])
    if choice == "Happy Hour"

    elsif choice == "Location"
        choice = prompt.select("Choose from the following neighborhoods:", [""])
    elsif choice == "Food"
        list = breweries.select(:food == true)
        puts list
        #puts a numbered list of options
    elsif choice == "Customer Rating"
        #prompt.slider('Rating', max: 10, step: 1, default: 7)
    elsif choice == "No, I have something in mind."
        prompt.ask("")
    end
end

def self.start_menu
    puts "Choose something you would like to do with your time in Denver"
end

end


# prompt.multi_select
# prompt.yes?