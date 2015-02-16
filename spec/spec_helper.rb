ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

Rspec.configure do |c|
  c.before(:each) do
    Vote.delete_all
  end
end
