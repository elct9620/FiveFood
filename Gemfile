source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'

gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'webpacker'

# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

gem 'sassc-rails'
gem 'slim'

gem 'acts-as-taggable-on', '~> 5.0'
gem 'geocoder'
gem 'graphql'
gem 'settingslogic'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano-rails'

  gem 'rspec-rails'

  gem 'dotenv-rails'
  gem 'pry-rails'

  gem 'factory_girl'
  gem 'faker'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'graphiql-rails', group: :development
