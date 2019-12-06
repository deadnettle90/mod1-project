# Objectives

Create and store user information.
Store the users preferred city and favorite brewery.
Sort through a list of Colorado Breweries, based on location and type of brewery.
Be able to update preferred city and favorite brewery.


# Background

Our brewery application is using an API that we have selectively chosen from to provide a list of Colorado Breweries. From this list we are able to allow our user to select available breweries by the city and type of brewery. Through this selection, we provide a list of cities as well as an option to manually enter in a city if not available. 
Once a city is selected we move onto selecting a type of brewery. Once selected here we can provide a list to our users based on selection.
After the user has selected a brewery this saves as a "favorite" and stores to the user profile. The user can also change the preferred city as well as favorite brewery.

# Understanding our data

We used the API from Open Brewery DB (https://www.openbrewerydb.org). This was a list of breweries from all of the US, so we selected the 9 pages of breweries specific to Colorado and implemented that into our app. Here is a selection from the API used here:

brewery hash
"id": 1625,
"name": "Wild Woods Brewery",
"brewery_type": "micro",
"street": "5460 Conestoga Ct",
"city": "Boulder",
"state": "Colorado",
"postal_code": "80301-2724",
"country": "United States",
"longitude": "-105.2258104",
"latitude": "40.0162153",
"phone": "3034841465",
"website_url": "http://www.wildwoodsbrewery.com",
"updated_at": "2018-08-24T00:25:13.496Z",
"tag_list": []






