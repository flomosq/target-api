source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'activeadmin', '~> 2.9'
gem 'active_storage_base64', '~> 1.2'
gem 'aws-sdk-s3', '~> 1.91', require: false
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise_token_auth', '~> 1.1.5'
gem 'dotenv-rails', '~> 2.7'
gem 'jbuilder', '~> 2.11'
gem 'sendgrid', '~> 1.2'
gem 'webpacker', '~> 5.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'approvals', '~> 0.0.11'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'faker', '~> 2.16'
  gem 'rspec-json_expectations', '~> 2.2'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'shoulda-matchers', '~> 4.5'
end

group :development do
  gem 'annotate', '~> 3.1.1'
  gem 'brakeman', '~> 5.0.0'
  gem 'listen', '~> 3.3'
  gem 'rails_best_practices', '~> 1.20.0'
  gem 'reek', '~> 6.0.3'
  gem 'rubocop-rails', '~> 2.9.1', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'draper', '~> 4.0'
