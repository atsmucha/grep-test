class CreateLocations < ActiveRecord::Migration
  def change
    create_table :Location do |t|
        t.text :name
        t.text :address
        t.st_point :coordinate, geographic: true
        t.index :coordinate, using: :gist
    end
  end

end
