source 'https://rubygems.org'

ruby '2.6.1'

gem 'rails', '~> 5.2.3'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# using Twitter bootstrap library for front end UI and layout
gem 'bootstrap-sass', '~> 3.3'

# using font awesome sass gem for adding icons
gem 'font-awesome-sass', '~> 4.7'

# Use hirb for better database display in console
gem 'hirb'

# use Devise for User Authentication
gem 'devise', '~> 4.6', '>= 4.6.2'

# use Stripe for payment processing
gem 'stripe', '~> 4.21', '>= 4.21.2'

# use Figaro for ENV variables
gem 'figaro', '~> 1.1', '>= 1.1.1'

# use PaperClip for image upload
gem 'paperclip', '~> 6.1'

# needed to save images to S2 since Heroku won't allow users to upload images
# and we allow users to upload an avatar in our app
gem 'aws-sdk', '~> 3.0', '>= 3.0.1'

# this is needed in order for the .env file to be loaded for local development
group :development, :test do
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.4'
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3', '~> 1.3.13'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.1', '>= 3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end
group :production do
  #Use the PostgreSQL gem for Hiroku production servers
  gem 'pg', '~> 1.1', '>= 1.1.4'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
