$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "contrast/user_api"

RSpec.configure do |config|
  unless ENV['INTEGRATION_TESTS'].to_s == "true"
    config.filter_run_excluding :integration => true
  end
end
