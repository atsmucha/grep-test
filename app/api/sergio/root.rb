module SERGIO
  class Root < Grape::API
    version 'sergio', using: :path
    
    mount SERGIO::Location
    mount SERGIO::Instagram
    mount SERGIO::Search
  end
end