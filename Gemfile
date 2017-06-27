source 'https://rubygems.org'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}.git" }

ruby '~> 2.3.3'

gem 'rails', '~> 4.2.6'

gem 'ahoy_matey'
gem 'american_date'
gem 'aws-sdk-core'
gem 'base32-crockford'
gem 'browserify-rails'
gem 'devise', '~> 4.1'
gem 'devise_security_extension'
gem 'dotiw'
gem 'figaro'
gem 'foundation_emails'
gem 'gibberish'
gem 'gyoku'
gem 'hashie'
gem 'hiredis'
gem 'http_accept_language'
gem 'httparty'
gem 'json-jwt'
gem 'lograge'
gem 'newrelic_rpm'
gem 'pg'
gem 'phony_rails'
gem 'premailer-rails'
gem 'proofer', github: '18F/identity-proofer-gem', branch: 'master'
gem 'rack-attack'
gem 'rack-cors', require: 'rack/cors'
gem 'readthis'
gem 'redis-session-store', github: '18F/redis-session-store', branch: 'master'
gem 'rqrcode'
gem 'ruby-progressbar'
gem 'ruby-saml'
gem 'saml_idp', git: 'https://github.com/18F/saml_idp.git', tag: 'v0.4.1-18f'
gem 'sass-rails', '~> 5.0'
gem 'savon'
gem 'scrypt'
gem 'secure_headers', '~> 3.0'
gem 'sidekiq'
gem 'simple_form'
gem 'sinatra', require: false
gem 'slim-rails'
gem 'stringex'
gem 'twilio-ruby'
gem 'two_factor_authentication', github: 'Houdini/two_factor_authentication', ref: '1d6abe3'
gem 'uglifier', '>= 1.3.0'
gem 'valid_email'
gem 'whenever', require: false
gem 'xml-simple'
gem 'xmlenc', '~> 0.6.4'
gem 'zxcvbn-js'

group :deploy do
  gem 'capistrano'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-sidekiq'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'bummr', require: false
  gem 'derailed'
  gem 'fasterer', require: false
  gem 'guard-rspec', require: false
  gem 'overcommit', require: false
  gem 'quiet_assets'
  gem 'rack-mini-profiler', require: false
  gem 'rails-erd'
  gem 'rails_layout'
  gem 'reek'
  gem 'rubocop', require: false
end

group :development, :test do
  gem 'bullet'
  gem 'front_matter_parser'
  gem 'i18n-tasks'
  gem 'mailcatcher', require: false
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.5.2'
  gem 'slim_lint'
  gem 'teaspoon-mocha'
  gem 'thin'
end

group :test do
  gem 'axe-matchers'
  gem 'capybara-screenshot', github: 'mattheworiordan/capybara-screenshot'
  gem 'codeclimate-test-reporter', require: false
  gem 'coffee-script'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'poltergeist'
  gem 'rack-test'
  gem 'rack_session_access'
  gem 'shoulda-matchers', '~> 3.0', require: false
  gem 'test_after_commit'
  gem 'timecop'
  gem 'webmock'
  gem 'zonebie'
end

group :production do
  gem 'equifax', git: 'git@github.com:18F/identity-equifax-api-client-gem.git', branch: 'master'
  gem 'mandrill_dm'
end
