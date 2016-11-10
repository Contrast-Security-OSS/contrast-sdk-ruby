require 'spec_helper'
require 'yaml'
require 'pp'

describe "This is an Integration Test", :integration do
  it "should parse a YAML file with settings" do
    hash = YAML.load(IO.read("spec/integration.yml"))
    expect(hash['not_here']).to be_nil

    expect(hash['host']).to_not be_nil
    expect(hash['org_uuid']).to_not be_nil
    expect(hash['api_key']).to_not be_nil
    expect(hash['service_key']).to_not be_nil
  end

  it 'should be able to return applications from local server' do
    api = Contrast::UserApi::API.new(nil)
    pp api.applications

  end
end
