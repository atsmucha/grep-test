class CreateInstagramRestaurants < ActiveRecord::Migration
  def change
    create_table :Instagram_Restaurant do |t|
        t.references :instagram
        # , limit: 8
        t.references :restaurant
    end
  end
end