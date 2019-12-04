require_relative 'config/environment'

Cli.welcome
# Cli.user_options


response1 = RestClient.get('https://api.openbrewerydb.org/breweries?by_city=denver&page=1&per_page=50')
response2 = RestClient.get('https://api.openbrewerydb.org/breweries?by_city=denver&page=2&per_page=50')
result = JSON.parse(response1)


result.map do |brewery|
    Brewery.create(name: brewery["name"], location: brewery["city"])
end

binding.pry
0