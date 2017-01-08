source 'https://rubygems.org'

ruby '2.3.1'
#Need to specify our Ruby version for Heroku
gem 'rails', '4.2.7.1'
# We want to use sqlite3 for our DEVELOPMENT DB, but Heroku uses Postgres
gem 'sqlite3', group: :development
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
#gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'carrierwave'
gem 'fog-aws'
# gem 'figaro'
gem "figaro", "~> 0.7.0"
gem 'mini_magick'
gem 'devise', '~> 3.4.0'
gem 'twitter-bootstrap-rails', '~> 3.2', '>= 3.2.2'
gem 'searchkick'














#Heroku Gems
gem 'rails_12factor', group: :production
# Our Heroku Postgres DB
gem 'pg', group: :production







group :development, :test do

  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'

  gem 'spring'
end

