source 'https://rubygems.org'
ruby '2.1.1'

# infrastructure
gem 'rails', '4.1.1'
gem 'pg'
gem 'aws-sdk'
gem 'paperclip', github: 'thoughtbot/paperclip'
gem 'sidekiq'
gem 'redis'


# front-end gems
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 3.1.1.1'

# javascript gems
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

# facebook auth
gem 'omniauth-facebook', '~> 1.6.0'

#koala for facebook Graph API
gem 'koala'

#typhoeus for venmo API
gem 'typhoeus', '~> 0.6.8'

# rails gems
gem 'turbolinks'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'spring',        group: :development

# rspec
group :development, :test do
	gem 'dotenv-rails'
	gem 'pry'
	gem 'rspec-rails'
	gem 'better_errors', '~> 1.1.0'

	gem 'binding_of_caller', '~> 0.7.2'
  # gem 'unicorn-rails'
end

group :production do
	gem 'rails_12factor'
end

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
