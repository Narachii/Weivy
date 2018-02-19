require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Weivy
  class Application < Rails::Application
    config.generators.template_engine = :slim
    config.autoload_paths += %W(#{config.root}/lib #{config.root}/services)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
