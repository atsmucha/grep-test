module Formatter
  module Error
    def self.call message, backtrace, options, env
      { :status => 'error', :message => message }.to_json
    end
  end
end