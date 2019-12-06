UserBrewery.destroy_all
Brewery.destroy_all
User.destroy_all

user1 = User.create(name: "Lilly")
user2 = User.create(name: "Ted")
user3 = User.create(name: "Lyle")
user4 = User.create(name: "Kyle")
user5 = User.create(name: "Daisy")

brewery1 = Brewery.create(name: "Bottles n Brews", location: "Denver", brewery_type: "micro")
brewery2 = Brewery.create(name: "Chicks Who Brew", location: "Denver", brewery_type: "micro")
brewery3 = Brewery.create(name: "Dog Lovers", location: "Telluride", brewery_type: "regional")
brewery4 = Brewery.create(name: "Keggers", location: "Denver", brewery_type: "brewpub")
brewery5 = Brewery.create(name: "Max's", location: "Denver", brewery_type: "micro")
brewery5 = Brewery.create(name: "Mx's", location: "Denver", brewery_type: "micro")
brewery5 = Brewery.create(name: "Tax's", location: "Denver", brewery_type: "micro")
brewery5 = Brewery.create(name: "Lax's", location: "Denver", brewery_type: "micro")
brewery5 = Brewery.create(name: "Fax's", location: "Denver", brewery_type: "micro")

fav1 = UserBrewery.create(brewery: brewery2, user: user1)


# def brewery_list
#     page_numbers= (1..9).to_a
#     page_numbers.map do |page_number|
#         response = RestClient.get("https://api.openbrewerydb.org/breweries?page=#{page_number}&per_page=1")
#         result = JSON.parse(response)
#         # binding.pry
#         result
#     end
# end
# brewery_list

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
