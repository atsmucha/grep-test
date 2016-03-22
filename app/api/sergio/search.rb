module SERGIO
    class Search < Grape::API
        
        namespace 'search' do
            
            desc 'Search Module'
            params do
                requires :word, type: String, desc: 'search word'
            end     #params
            post '', jbuilder: 'search/search' do
                status :ok
                splitedWord = (params[:word]).split
                # sillim, guro
                # @test = ::Location.joins(:Restaurant).find_by_name(splitedWord[0])
                # @test = ::Location.joins(:Restaurant).where("Restaurant.name like ?", "%"+splitedWord[0]+"%")

                @test = ::Location.where("name like ?", "%"+splitedWord[0]+"%")
                puts  @test[1].attributes


                # @test1 = @test.Restaurant
                # puts @test1.attributes

                # ::Restaurant.find_by_name(splitedWord[1])

                # ::Location.joins(:Restaurant).where("name like ?", "%" + splitedWord[1] + "%")

            end #Search Module API

        end     #Namespace Search

    end         #Class Search
end             #Module SERGIO