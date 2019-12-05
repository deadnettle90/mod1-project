class AddBreweryTypeColumnToBreweryTable < ActiveRecord::Migration[6.0]
  def change
    add_column :breweries, :brewery_type, :string
  end
end
