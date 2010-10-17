source 'http://rubygems.org'

gem 'rails', '3.0.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
 group :development, :test do
   gem 'sqlite3-ruby', :require => 'sqlite3'
 end
 
group :production do
  gem 'mysql', '2.8.1'
end

gem "mongrel", :group => :development
gem "factory_girl_rails", :group => :test
gem "ffaker", :group => :test
gem "shoulda", :group => :test
gem "cucumber-rails", :group => :test
gem "pickle", :group => :test
gem "capybara", :group => :test
gem "devise"
gem "jquery-rails"
gem "cancan"
gem "geokit"