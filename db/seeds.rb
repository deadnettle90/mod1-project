user1 = User.create(name: "Lilly")
user2 = User.create(name: "Ted")
user3 = User.create(name: "Lyle")
user4 = User.create(name: "Kyle")
user5 = User.create(name: "Daisy")

brewery1 = Brewery.create(name: "Bottles n Brews", location: "RiNo", happy_hour: "3-5", food: "no", hours: "12-8", rating: 8.5, review: " ")
brewery2 = Brewery.create(name: "Chicks Who Brew", location: "RiNo", happy_hour: "no", food: "yes", hours: "12-8", rating: 9.5, review: " ")
brewery3 = Brewery.create(name: "Dog Lovers", location: "Baker", happy_hour: "3-6", food: "yes", hours: "2-12", rating: 7, review: " ")
brewery4 = Brewery.create(name: "Keggers", location: "LoDo", happy_hour: "1-4", food: "no", hours: "2-10", rating: 6, review: " ")
brewery5 = Brewery.create(name: "Max's", location: "5 Points", happy_hour: "no", food: "yes", hours: "12-8", rating: 8, review: " ")

UserBrewery.create()