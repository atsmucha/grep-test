module Formatter
  module Success
    # This module can not be used when using Jbuilder
    def self.call object, env
        {:status => 'success', :data => object}.to_json
    end
  end
end