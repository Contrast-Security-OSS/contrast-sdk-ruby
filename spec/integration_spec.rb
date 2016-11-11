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

  let(:api) { Contrast::UserApi::API.new('spec/integration.yml') }

  it 'should be able to return applications from local server' do
    pp api.applications

  end

  it 'should be able to return system messages from local server' do
    pp api.messages
    pp api.next_message
  end

  it 'should be able to return modules from local server' do
    pp api.modules
    pp api.modules(['scores'])
  end

  it 'should be able to return alerts from local server' do
    pp api.alerts
  end

  it 'should return organization and related info from local server' do
    pp api.organization
    pp api.organization_administrators
    pp api.organization_apikey
    pp api.organization_application_roles
    pp api.server_need_restart_on_change('Java')
    pp api.organization_application_stats
  end

  it 'should return profile info from local server' do
    pp api.roles
    pp api.profile
    pp api.password_policy
    pp api.user_roles
    pp api.report_preferences
    pp api.allowed_organizations
  end

  it 'should return security and validators from local server' do
    pp api.controls
    pp api.sanitizer_controls
    pp api.validator_controls
    pp api.control_suggestions
  end
end
