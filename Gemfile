source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3.1'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 3.12'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Bootstrap 4 rubygem for Rails https://rubygems.org/gems/bootstrap
gem 'bootstrap', '~> 4.3.1'

# A gem to automate using jQuery with Rails
gem 'jquery-rails'

# Pagination library for Rails, Sinatra, Merb, DataMapper, and more
gem 'will_paginate'

# Integrates the Twitter Bootstrap pagination component with will_paginate
gem 'will_paginate-bootstrap'

# Complete Ruby geocoding solution.
gem 'geocoder'

# Flexible authentication solution for Rails with Warden.
gem 'devise'

# Translations for the devise gem
gem 'devise-i18n'

# Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff http://rails-i18n.org
gem 'rails-i18n'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # A runtime developer console and IRB alternative with powerful introspection capabilities.
  gem 'pry'

  # Rails >= 3 pry initializer
  gem 'pry-rails'

  # Pretty print your Ruby objects with style in full color and with proper indentation
  gem 'awesome_print'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  gem 'listen', '>= 3.0.5', '< 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'

  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

  # A library for setting up Ruby objects as test data. https://thoughtbot.com/open-source
  gem "factory_bot_rails"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
