require 'spec_helper'
require 'yaml'
require 'pp'

describe "This is an Integration Test", :integration do
  it "should parse a YAML file with settings" do
    hash = YAML.load(IO.read("spec/integration.yml"))
    expect(hash['teamserver']).to be_a Hash

    expect(hash['teamserver']['host']).to_not be_nil
    expect(hash['teamserver']['org_uuid']).to_not be_nil
    expect(hash['teamserver']['api_key']).to_not be_nil
    expect(hash['teamserver']['authorization']).to_not be_nil
  end

  it 'should be able to return applications from local server' do
    api = Contrast::UserApi::API.new('spec/integration.yml')
    pp api.applications

  end
end
