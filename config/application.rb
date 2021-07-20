require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module ProjectName
  class Application < Rails::Application
    config.load_defaults 6.1
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.logger = Logger.new("log/project_name.log", 10, 5 * 1024 * 1024)
    config.active_job.queue_adapter = :delayed_job
    config.action_mailer.delivery_method = :ses
    config.action_mailer.default_url_options = {
      protocol: ENV['RE_PROTOCOL'],
      host: ENV['RE_HOST'],
      port: ENV['RE_PORT']
    }
    config.active_storage.service = ENV['RE_STORAGE'].to_sym
    routes.default_url_options = {
      protocol: ENV['RE_PROTOCOL'],
      host: ENV['RE_HOST'],
      port: ENV['RE_PORT']
    }
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: false,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false
    end
  end
end
