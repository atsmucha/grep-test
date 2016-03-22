class Restaurant < ActiveRecord::Base
    self.table_name = "Restaurant"

    has_many :InstagramRestaurant, dependent: :destroy

    belongs_to :Location

end
