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

  # NOTE: the following specs don't really do anything yet. They hit a
  # teamserver instance defined in the config file and return a response
  it 'should be able to return applications from local server' do
    pp api.applications_allowed
    pp response = api.applications
    response.fetch('applications', []).each do |application|
      id = application['app_id']
      pp api.application(id)
      pp api.application_license(id)
      pp api.application_component(id)
      pp api.application_coverage(id)
      pp api.application_coverage_weekly_stats(id)
      pp api.application_history(id)
      pp api.application_libraries(id)
      pp api.application_libraries_filter(id)
      pp api.application_libraries_stats(id)
      pp api.application_status_breakdown(id)
      pp api.application_trace_breakdown(id)
      pp api.application_servers(id)
      pp api.application_servers_breakdown(id)
      pp api.application_servers_count(id)
      pp api.application_newest_server(id)
      pp api.application_servers_properties(id)
      pp api.application_servers_settings(id)
      pp api.application_technologies(id)
      pp api.application_traces_filter(id)
      pp api.export_application_traces_csv(id)
      pp api.export_application_traces_csv_all(id)
      pp api.export_application_traces_xml(id)
      pp api.export_application_traces_xml_all(id)
      pp api.tags_by_application(id)
      pp api.tags_libraries_for_application(id)
      pp api.unique_traces_by_application(id)
    end
    pp api.applications_simplified
    pp api.applications_filters
    pp api.applications_filters_quick
    pp api.applications_name
  end

  it 'should be able to return agent info' do
    pp response = api.profiles
    pp api.versions
  end

  it 'should be able to return actvity messages from local server' do
    pp api.inactive_activity
    pp api.newest_activity
    pp api.recent_activity
  end

  it 'should be able to return library from local server' do
    pp api.libraries
    pp api.libraries_filter
    pp api.libraries_subfilter
    pp api.libraries_stats
    pp api.library_policy
    pp api.library_policy_libraries
  end

  it 'should be able to return events from local server' do
    pp api.events
    pp api.events_application
    pp api.events_server
    pp api.events_trace
  end

  it 'should be able to return history from local server' do
    pp api.history_scores
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

  it 'should return score information' do
    pp api.scores
    pp api.scores_breakdown_category
    pp api.scores_breakdown_rule
    pp api.scores_breakdown_server
    pp api.scores_breakdown_severity
    pp api.scores_breakdown_status
    pp api.scores_breakdown_trace
    pp api.scores_breakdown_trace_rule
    pp api.scores_breakdown_trace_severity
    pp api.scores_breakdown_trace_status
    pp api.platform_score
    pp api.platform_score_with_defense
    pp api.organization_security_score
    pp api.organization_security_score_with_defense
  end

  it 'should return server information' do
    pp response = api.servers
    response.fetch('servers', []).each do |server|
      server_id = server['server_id']
      pp api.server(server_id)
      pp api.server_activity(server_id)
      pp api.server_activity_unity(server_id)
      pp api.server_attack_status_breakdown(server_id)
      pp api.server_attack_type_breakdown(server_id)
      pp api.server_attack_severity_breakdown(server_id)
      pp api.server_attack_rule_breakdown(server_id)
      pp api.server_libraries_breakdown(server_id)
      pp api.server_properties(server_id)
      pp api.tags_libraries_by_server(server_id)
      pp api.tags_traces_by_server(server_id)
    end
    pp api.active_servers
    pp api.servers_filter
    pp api.servers_filters
    pp api.servers_modes
  end

  it 'should return tag information' do
    pp api.applications_tags_list
    pp api.tag_libraries_list
    pp api.tags_servers_list
    pp api.tags_traces
  end

  it 'should return trace information' do
    pp api.export_traces_csv
    pp api.export_all_traces_csv
    pp api.export_traces_xml
    pp api.export_all_traces_xml
    pp api.orgtraces_ids
    pp api.orgtraces_with_policy_violations
    pp api.orgtraces_quick_filters
  end
end
