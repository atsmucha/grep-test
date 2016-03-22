require "grape-swagger"

class API < Grape::API
  # include ::ActionController::Serialization
  prefix 'api'
  format :json
  formatter :json, 
  Grape::Formatter::Jbuilder
  # Formatter::Success
  # Grape::Formatter::ActiveModelSerializers
  error_formatter :json, Formatter::Error

  helpers do

    def model_to_hash(model)
      model.map{|model| [model.attributes]}.to_a
    end   #model_to_hash

    def distance_between(lat, long, point)
      ::Location.distance_between(lat, long, point)
    end

    # This method is not use
    def timeago(elements)
        year = 0
        format = ["Y", "U", "d", "H", "M"].to_a
        format.each do |format|
            # 인스타에서 오는 timestamp형식(Integer Type)
            
            now = Time.now.getutc.strftime("%#{format}").to_i
            time = Time.parse(elements.to_s).strftime("%#{format}").to_i
            
            result = now - time

            unless result.zero?
              case format
              when 'Y'
                year = result
                text = 'year'
              when 'U'
                result = ((year*53)-time)+now
                return "#{result}week"
              when 'd'
                return "#{result}day"
              when 'H'
                return "#{result}Hour"
              when 'M'
                return "#{result}Minute"
             end      #case
           end        #unless result.zefo?
        end           #each format
    end               #timeago
    
    #Moon-o version
    


  end   #helpers


  
  mount SERGIO::Root
  add_swagger_documentation(
    base_path: "/",
    hide_format: true,
    hide_documentation_path: true, 
    api_version: 'sergio')

end