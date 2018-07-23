source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.6'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

#  devise
gem 'devise'

# pagenation
gem 'kaminari'

# bootstrap
gem 'bootstrap', '~> 4.1.1'
gem 'jquery-rails'

# font-awesome
gem "font-awesome-rails"

# seed-fu
gem 'seed-fu'

# refile
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Hirb
  gem 'hirb'
  gem 'hirb-unicode'
  # デバッグ
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  # テスト
  gem 'rspec-rails'
  gem "factory_bot_rails"
  gem 'faker'
  gem 'rails-controller-testing'
end

group :test do
  gem 'database_cleaner'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # rspec
  gem 'spring-commands-rspec'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
