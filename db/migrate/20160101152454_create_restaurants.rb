class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :Restaurant do |t|
        t.text :name
        t.references :location
        t.integer :count
        t.float :score, limit: 4    #real
    end
  end
end
