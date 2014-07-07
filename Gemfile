source 'http://rubygems.org'

if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

gem 'kaminari'
gem 'nokogiri'
gem 'rails', '3.2.7'
gem 'rubyzip'
gem 'thin'
gem 'airbrake'
gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'uglifier'
end

group :development do
  gem 'bullet'
  gem 'rails_best_practices'
end

group :development do
  gem 'passenger'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'rdeploy', '>= 0.3.0', :git=> "git@github.com:cgservices/rdeploy.git"
end

group :development, :test do
  gem 'rspec-rails'
  gem 'mysql2'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end
