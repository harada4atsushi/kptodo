Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # FIXME 移動する config/initializers/devise.rb
  Devise.setup do |config|
    config.omniauth :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_APP_SECRET"], :scope => 'email'
    config.omniauth :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
    config.omniauth :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"]
  end

  #Rails.application.config.middleware.use OmniAuth::Builder do
  #  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'], { provider_ignores_state: true }
  #end

  config.middleware.use ExceptionNotification::Rack,
  :email => {
    :email_prefix => "[Kptodo] ",
    :sender_address => %{"notifier" <notfy@kptodo.tokyo>},
    :exception_recipients => %w{ ENV["NOTIFY_MAIL"] }
  }

  config.action_mailer.default_url_options = { :host => "localhost", :port => 3000 }
  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

  Slim::Engine.default_options[:pretty] = true
end
