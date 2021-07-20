source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


ruby '3.0.1'


gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'image_processing', '~> 1.2'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails'
gem 'devise_token_auth'
gem 'rails-i18n'
gem 'aws-sdk-rails'
gem 'aws-sdk-s3'
gem 'delayed_job_active_record'
gem 'daemons'
gem 'whenever', require: false
gem 'kaminari'


group :development, :test do
  gem 'factory_bot_rails'
end


group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'spring-commands-rspec'
end


group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-rails'
  gem 'rexml'
end
