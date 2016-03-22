module SERGIO
    class Instagram < Grape::API
        include Grape::Kaminari
        
        

        # namespace :instagram do
        #     # http://localhost:3000/api/sergio/instagram/:id
        #     desc '1. Get all Instagrams data related to restaurant 

        #     2.Default pagination count is 20 (Add per_page parameter, it is possible to change the page count)'
        #     paginate per_page: 20
        #     params do
        #         requires :id, type: Integer, desc: 'restaurant id, not Instagram id'
        #     end     #params
            
        #     post '', jbuilder: 'instagram/instagram' do

        #         status :ok
        #         @instagram = ::Instagram.joins(:InstagramRestaurant).order("created DESC").where(Instagram_Restaurant: {restaurant_id: params[:id]})
        #         if @instagram.blank?
        #             error!("That's NONO~ no data", 404)
        #         end

        #         paginate(@instagram)
                
        #     end     #/instagram

        # end         #Instagram Namespace

    end             #Instagram Class
end                 #SERGIO Module