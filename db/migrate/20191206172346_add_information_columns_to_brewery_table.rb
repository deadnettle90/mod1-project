class AddInformationColumnsToBreweryTable < ActiveRecord::Migration[6.0]
  def change
    add_column :breweries, :street, :string
    add_column :breweries, :phone, :string
    add_column :breweries, :website_url, :string
  end
end
