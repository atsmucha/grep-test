module SERGIO
    class Location < Grape::API
        # include Grape::Kaminari



        # namespace 'location' do
        #     desc 'Get this nearby Restaurants data'
        #     # paginate per_page:20
        #     params do
        #         requires :lat, type: String, desc: 'user location latitude'
        #         requires :long, type: String, desc: 'user location longitude'
        #         requires :distance, type: Integer, desc: 'search distance'
        #         requires :limit, type: Integer, desc: 'search count'
        #     end
        #     post '/near', jbuilder: 'location/near' do
        #         status :ok
        #         @grep  = ::Location.grep(params[:lat].to_f, params[:long].to_f, params[:distance].to_i, params[:limit].to_i)
                
        #         if @grep.blank?
        #             error!("That's NONO~ no data", 404)
        #         end
        #         # @grep = paginate(grep)
        #     end         #/near 
            

        # end     #location Resource
    end     #location Class
end         #SERGIO Module