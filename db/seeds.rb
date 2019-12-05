UserBrewery.destroy_all
Brewery.destroy_all
User.destroy_all

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

def brewery_list
    page_numbers= (1..9).to_a
    page_numbers.map do |page_number|
        response = RestClient.get("https://api.openbrewerydb.org/breweries?page=#{page_number}&per_page=1")
        result = JSON.parse(response)
        # binding.pry
        result
    end
end
brewery_list

# brewery hash
# "id": 1625,
# "name": "Wild Woods Brewery",
# "brewery_type": "micro",
# "street": "5460 Conestoga Ct",
# "city": "Boulder",
# "state": "Colorado",
# "postal_code": "80301-2724",
# "country": "United States",
# "longitude": "-105.2258104",
# "latitude": "40.0162153",
# "phone": "3034841465",
# "website_url": "http://www.wildwoodsbrewery.com",
# "updated_at": "2018-08-24T00:25:13.496Z",
# "tag_list": []
