class Instagram < ActiveRecord::Base
    self.table_name = "Instagram"

    # belongs_to :InstagramRestaurant
    
    has_one :InstagramRestaurant, dependent: :destroy
    # has_one :Restaurant, through: :Restaurant

    

end
