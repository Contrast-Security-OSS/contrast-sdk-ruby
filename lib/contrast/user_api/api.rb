module Contrast
  module UserApi
    class API
      extend Forwardable

      def_delegators :@application_api,
          :applications_name,
          :applications,
          :application,
          :applications_allowed,
          :applications_simplified,
          :applications_filters,
          :applications_filters_quick,
          :applications_subfilters,
          :update_application_importance,
          :application_license,
          :application_component,
          :application_coverage,
          :application_coverage_weekly_stats,
          :application_history,
          :application_history_by_interval,
          :application_history_by_interval_with_defense,
          :application_libraries,
          :application_libraries_filter,
          :application_libraries_filter_by_type,
          :application_libraries_stats,
          :application_status_breakdown,
          :application_servers,
          :application_servers_breakdown,
          :application_servers_count,
          :application_newest_server,
          :application_servers_properties,
          :application_servers_settings,
          :application_servers_settings_by_environment,
          :application_technologies,
          :application_trace_breakdown,
          :application_trace_rule_breakdown,
          :application_trace_severity_breakdown,
          :application_trace_status_breakdown,
          :application_traces_filter,
          :application_traces_subfilter,
          :application_traces_subfilter_keycode_search,
          :application_traces_subfilter_keycode_search_simplified,
          :application_traces_subfilter_keycode_severities,
          :application_traces_subfilter_keycode_status,
          :application_filter_trace,
          :delete_application_traces,
          :delete_application_trace,
          :export_application_traces_csv,
          :export_application_traces_csv_all,
          :export_application_traces_xml,
          :export_application_traces_xml_all,
          :application_trace_uuids,
          :application_traces_with_policy_violations,
          :application_traces_quick_filters,
          :application_trace_requirements,
          :application_trace_servers,
          :application_trace_url_instances,
          :export_application_traces_subfilter_keycode_csv,
          :export_application_traces_subfilter_keycode_xml,
          :application_trace_simplified,
          :application_trace_visibility

      def_delegators :@activity_api,
          :inactive_activity,
          :newest_activity,
          :recent_activity,
          :application_agent_activity

      def_delegators :@libraries_api,
          :libraries,
          :libraries_filter,
          :dotnet_libraries,
          :java_libraries,
          :libraries_subfilter,
          :libraries_stats,
          :libraries_filters_listing,
          :library_policy,
          :update_library_policy,
          :library_policy_libraries

      def_delegators :@events_api,
          :events,
          :events_application,
          :events_server,
          :events_trace

      def_delegators :@history_api,
          :history_scores,
          :history_scores_by_interval,
          :history_scores_with_defense_by_interval

      def_delegators :@messages_api, 
          :messages,
          :next_message

      def_delegators :@modules_api,
          :modules,
          :application_modules

      def_delegators :@alerts_api,
          :alerts,
          :alert

      def_delegators :@organizations_api,
          :organization,
          :organization_administrators,
          :organization_apikey,
          :organization_application_roles,
          :server_need_restart_on_change,
          :organization_application_stats,
          :organization_library_stats,
          :organization_server_stats,
          :organization_trace_stats,
          :server_settings,
          :update_server_settings,
          :update_assess_settings,
          :update_bot_protection_settings,
          :update_defend_settings,
          :organization_search

      def_delegators :@profile_api,
          :roles,
          :profile,
          :update_profile,
          :update_expired_password,
          :update_password,
          :password_policy,
          :user_roles,
          :toggle_profile,
          :report_preferences,
          :update_default_organization,
          :allowed_organizations,
          :organization_by_uuid

      def_delegators :@security_api,
          :controls,
          :sanitizer_controls,
          :sanitizer_control,
          :create_sanitizer_control, 
          :update_sanitizer_control, 
          :toggle_sanitizer_control,
          :delete_sanitizer_control,
          :control_suggestions,
          :create_sanitizer_control_suggestion,
          :undo_sanitizer_control_suggestion,
          :delete_sanitizer_control_suggestion,
          :create_validator_control_suggestion,
          :undo_validator_control_suggestion,
          :delete_validator_control_suggestion,
          :validator_control,
          :validator_controls,
          :create_validator_control,
          :update_validator_control,
          :delete_validator_control,
          :toggle_validator_control

      attr_reader :host,
          :org_uuid,
          :api_key, 
          :authorization_base64

      def initialize config = nil
        options = load_config(config)
        raise ArgumentError.new("Unable to load config options from #{ config }") unless options.is_a?(Hash)
        raise ArgumentError.new("Expected a configuration section named 'teamserver'") unless options['teamserver'].is_a?(Hash)

        teamserver = options['teamserver']
        @host = teamserver['host'] # 'http://localhost:19080/Contrast/'
        @org_uuid = teamserver['org_uuid'] # '9c1dd905-e8d5-447b-b1be-00cbda0d0e67'
        @api_key = teamserver['api_key'] # 'demo'
        @authorization_base64 = teamserver['authorization'] # 'Y29udHJhc3RfYWRtaW46ZGVtbw=='

        @activity_api = with_defaults(ActivityApi)
        @application_api = with_defaults(ApplicationApi)
        @libraries_api = with_defaults(LibrariesApi)
        @events_api = with_defaults(EventsApi)
        @history_api = with_defaults(HistoryApi)
        @messages_api = with_defaults(MessagesApi)
        @modules_api = with_defaults(ModulesApi)
        @alerts_api = with_defaults(AlertsApi)
        @organizations_api = with_defaults(OrganizationsApi)
        @profile_api = with_defaults(ProfileApi)
        @security_api = with_defaults(SecurityApi)
      end

      def load_config config 
        if config.is_a?(Hash)
            config
        else
          [ (config ? config.to_s : nil ),
            ENV["CONTRAST_SECURITY_CONFIG"], 
            'contrast_security.yml', 
            'config/contrast_security.yml', 
            '/etc/contrast_security.yml' 
          ].each do |path|
            if path && File.readable?(path)
              break YAML.load(IO.read(path))
            else
              nil
            end
          end
        end
      end

      def with_defaults clazz
        inst = clazz.new('api/ng')
        inst.org_uuid = org_uuid
        inst.class.base_uri(base_uri)
        inst.class.headers(headers)
        inst
      end

      def base_uri
        host
      end

      def headers
        {
          "API-Key" => api_key,
          "Authorization" => authorization_base64
        }
      end
    end
  end
end
