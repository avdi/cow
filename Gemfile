source 'http://rubygems.org'

RAILS_VERSION = '~> 3.2.12'
DM_VERSION    = '~> 1.2.0'

gem 'rack',               '~> 1.4.5'
gem 'activesupport',      RAILS_VERSION, :require => 'active_support'
gem 'actionpack',         RAILS_VERSION, :require => 'action_pack'
gem 'actionmailer',       RAILS_VERSION, :require => 'action_mailer'
gem 'activeresource',     RAILS_VERSION, :require => 'active_resource'
gem 'railties',           RAILS_VERSION, :require => 'rails'
gem 'tzinfo'

gem 'dm-rails',          '~> 1.2.1'

# You can use any of the other available database adapters.
# This is only a small excerpt of the list of all available adapters
# Have a look at
#
#  http://wiki.github.com/datamapper/dm-core/adapters
#  http://wiki.github.com/datamapper/dm-core/community-plugins
#
# for a rather complete list of available datamapper adapters and plugins

# gem 'dm-sqlite-adapter',    DM_VERSION
# gem 'dm-mysql-adapter',     DM_VERSION
# gem 'dm-postgres-adapter',  DM_VERSION
# gem 'dm-oracle-adapter',    DM_VERSION
# gem 'dm-sqlserver-adapter', DM_VERSION

gem 'dm-migrations',        DM_VERSION
gem 'dm-types',             DM_VERSION
gem 'dm-validations',       DM_VERSION
gem 'dm-constraints',       DM_VERSION
gem 'dm-transactions',      DM_VERSION
gem 'dm-aggregates',        DM_VERSION
gem 'dm-timestamps',        DM_VERSION
gem 'dm-observer',          DM_VERSION

group :production do
  gem 'dm-postgres-adapter',  DM_VERSION
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end

gem "sinatra", :require => 'sinatra/base'
gem "erector", '= 0.9.0.pre1'
gem 'anjlab-bootstrap-rails', '~> 2.0', :require => 'bootstrap-rails'
gem 'fattr'
gem 'rack_clicky'
gem 'newrelic_rpm'

group :development do
  gem "passenger"
end

group :test, :development do
  gem 'dm-sqlite-adapter', DM_VERSION
  gem "rspec-rails"
  gem "guard"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-passenger"
  gem "rack-test"
end
