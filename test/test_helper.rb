ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  
  fixtures :all

  def batches_url
    '/api/v1/batches'
  end

  def batch_url 
    '/api/v1/batches/#{batch_id}'
  end
end
