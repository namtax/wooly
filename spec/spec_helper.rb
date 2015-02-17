ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'capybara/rails'

Rspec.configure do |c|
  c.include Capybara::DSL

  c.before(:each) do
    Vote.delete_all
  end
end


