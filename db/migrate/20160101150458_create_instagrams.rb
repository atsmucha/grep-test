class CreateInstagrams < ActiveRecord::Migration
  def change
    create_table :Instagram, {id: :bigserial} do |t|
        t.bigint :media_id
        t.timestamp :created
        t.text :link
        t.text :image
        t.integer :likes
        t.text :text
        t.integer :comments
        t.integer :user_id
        t.text :user
        t.text :location
        t.text :latitude
        t.text :longitude
    end
  end
end
