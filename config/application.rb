require File.expand_path('../boot', __FILE__)

require "rails"
require "rails/all"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "grape-active_model_serializers"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# class ActiveRecordOverrideRailtie < Rails::Railtie
#   initializer "active_record.initialize_database.override" do |app|

#     ActiveSupport.on_load(:active_record) do
#       if url = ENV['DATABASE_URL']
#         ActiveRecord::Base.connection_pool.disconnect!
#         parsed_url = URI.parse(url)
#         config =  {
#           adapter:             'postgis',
#           host:                parsed_url.host,
#           encoding:            'unicode',
#           database:            parsed_url.path.split("/")[-1],
#           port:                parsed_url.port,
#           username:            parsed_url.user,
#           password:            parsed_url.password
#         }
#         establish_connection(config)
#       end
#     end
#   end
# end

module GrapeTest
  class Application < Rails::Application

    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += [config.root.join('app', '*')]
    # Dir[Rails.root.join('app', 'api', '*')]
    # config.autoload_paths += %W(#{config.root}/lib)
    
    config.middleware.use(Rack::Config) do |env|
      env['api.tilt.root'] = Rails.root.join 'app', 'views', 'api'
    end

    config.active_record.raise_in_transactional_callbacks = true

    # Setting cross origin resource sharing
    config.middleware.insert_before 0, "Rack::Cors" do
        allow do
            origins '*'
            resource '*',
            :headers => :any,
            :methods => [:get, :post, :delete, :put, :options],
            :credentials => true,
            :max_age => 86400
        end
    end
    
  end
end
