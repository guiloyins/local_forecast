# frozen_string_literal: true

source "https://rubygems.org"

gem "bootsnap", require: false
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails", "~> 7.2.1"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "brakeman", require: false
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "rspec-rails"
end

group :development do
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", ">= 2.22.0", require: false
  gem "web-console"
end

group :test do
  gem "vcr"
  gem "webmock"
end
