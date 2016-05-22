source 'https://rubygems.org'

ruby "2.3.0"

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'pg', '~> 0.18'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'haml-rails', '~> 0.9.0'
gem 'descriptive_statistics', '~> 2.5.1', :require => 'descriptive_statistics/safe'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug'
  gem 'pry'
end

group :test do
  gem 'rspec-rails', '~> 3.5.0.beta3'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
