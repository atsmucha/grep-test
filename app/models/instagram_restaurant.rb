class InstagramRestaurant < ActiveRecord::Base
    self.table_name = "Instagram_Restaurant"

    belongs_to :Instagram
    belongs_to :Restaurant

end
