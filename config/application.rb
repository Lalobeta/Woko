require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Woko
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Localization and Timezone
    config.i18n.default_locale = :es
    config.time_zone = "Monterrey"

    # Custom Initializers
    config.generators do |g|
      g.assets false
      g.helper false
      # Do not generate tests files on generator
      g.test_framework = nil
    end
  end
end
