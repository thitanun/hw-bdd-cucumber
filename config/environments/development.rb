require 'active_support/core_ext/integer/time'
Rottenpotatoes::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  # ENV['GOOGLE_OAUTH_CLIENT_ID'] = Rails.application.credentials.dig('597131133206-v3ekbc3k0n569b1e210mfnvab2ss8i5g.apps.googleusercontent.com')

  # ENV['GOOGLE_OAUTH_CLIENT_SECRET'] = Rails.application.credentials.dig('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')
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  #config.whiny_nils = true
  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  #config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  #config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
