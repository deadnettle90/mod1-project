class CreateBreweriesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :location
      t.string :happy_hour
      t.string :food
      t.string :hours
      t.float :rating
      t.text :review
    end
  end
end
