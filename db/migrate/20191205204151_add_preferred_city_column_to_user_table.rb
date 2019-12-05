class AddPreferredCityColumnToUserTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :preferred_city, :string
  end
end
