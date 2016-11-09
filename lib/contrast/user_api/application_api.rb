require 'httparty'

module Contrast
  module UserApi
    class ApplicationApi
      include HTTParty
      include ApiSupport

      def applications_allowed
        self.class.get(path("applications/allowed")) do |response|
          # TODO: build ApplicationsAllowedResponse
        end
      end

      def applications filters = nil, expand = nil, merged = nil, limit = nil, offset = nil, sort = nil
        params = query_params(expand, nil, merged, limit)
        params[:offset] = offset.to_i unless offset.nil?
        params[:sort] = sort unless sort.nil?

        if filters
          expect_class!(filters, Contrast::UserApi::ApplicationsFiltersRequest)
          params[:filters] = filters
        end

        self.cass.get(path("applications/filter"), { query: params }) do |response|
          # TODO: build ApplicationsFilterResponse
        end
      end

      def applications_simplified filters = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?

        if filters
          expect_class!(filters, Contrast::UserApi::ApplicationsFiltersRequest)
          params[:filters] = filters
        end

        self.cass.get(path("applications/filter/short"), { query: params }) do |response|
          # TODO: build ApplicationShortFilterResponse
        end
      end

      def applications_filters 
        self.class.get(path("applications/filters/listing")) do |response|
          # TODO: build ApplicationFilterCatalogResponse
        end
      end

      def applications_filters_quick filters = nil
        params = query_params(nil, nil, nil, nil)

        if filters
          expect_class!(filters, Contrast::UserApi::ApplicationsFiltersRequest)
          params[:filters] = filters
        end
        
        self.class.get(path("applications/filters/quick")) do |response|
          # TODO: build QuickFilterResponse
        end
      end

      def applications_subfilters filter_type, filters = nil, archived = nil
        params = query_params(nil, archived, nil, nil)

        if filters
          expect_class!(filters, Contrast::UserApi::ApplicationsFiltersRequest)
          params[:filters] = filters
        end

        self.class.get(path("applications/filters/#{ filter_type }/listing"), { query: params }) do |response|
          # TODO: build ApplicationFilterCatalogDetailsResponse
        end
      end

      def applications_name filters = nil, trial = nil, merged = nil
        params = query_params(nil, nil, merged, nil)
        params[:trial] = trial unless trial.nil?

        if filters
          expect_class!(filters, Contrast::UserApi::ApplicationsFiltersRequest)
          params[:filters] = filters
        end

        self.class.get(path("applications/name"), { query: params }) do |response|
          # TODO: build ApplicationsNameResponse
        end
      end

      def application app_id, expand = nil, merged = nil
        params = query_params(expand, nil, merged, nil)
        self.class.get(applications_path(app_id), { query: params }) do |response|
          # TODO: build ApplicationResponse
        end
      end

      def update_application_importance app_id, importance
        expect_class!(importance, Contrast::UserApi::ApplicationImportanceRequest)
        self.class.get(application_path(app_id, "importance"), { body: importance.to_hash }) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def application_license app_id
        self.class.get(application_path(app_id, "license")) do |response|
          # TODO: build ApplicationLicenseResponse
        end
      end

      def application_component app_id
        self.class.get(application_path(app_id, "components")) do |response|
          # TODO: build ApplicationComponentsResponse object
        end
      end

      def application_coverage app_id, merged = nil, limit = nil
        params = query_params(nil, nil, merged, limit)
        self.class.get(application_path(app_id, "coverage"), { query: params }) do |response|
          # TODO: build ApplicationCoverageResponse object
        end
      end

      def application_coverage_weekly_stats app_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "coverage/stats/week"), { query: params }) do |response|
          # TODO: build ApplicationCoverageStatsResponse object
        end
      end

      def application_history app_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "history"), { query: params }) do |response|
          # TODO: build HistoryScoresResponse object
        end
      end

      def application_history_by_interval app_id, environment, interval, merged = nil
        params = query_params(nil, nil, merged, nil)
        params[:environment] = environment
        params[:interval] = interval
        self.class.get(application_path(app_id, "history/interval"), { query: params }) do |response|
          # TODO: build HistoryScoresResponse object
        end
      end

      def application_history_by_interval_with_defense app_id, environment, interval, merged = nil
        params = query_params(nil, nil, merged, nil)
        params[:environment] = environment
        params[:interval] = interval
        self.class.get(application_path(app_id, "history/interval/defense"), { query: params }) do |response|
          # TODO: build HistoryScoresResponse object
        end
      end

      def application_libraries app_id, expand = nil, load_cve = nil, quick_filter = nil
        params = query_params(expand, nil, nil, nil)
        params[:loadCVE] = load_cve unless load_cve.nil?
        params[:quickFilter] = quick_filter unless quick_filter.nil?
        self.class.get(application_path(app_id, "libraries"), { query: params }) do |response|
          # TODO: build LibrariesResponse 
        end
      end

      def application_libraries_filter app_id, expand = nil, servers = nil, tags = nil, q = nil, quick_filter = nil
        params = query_params(expand, nil, nil, nil)
        params[:servers] = Array(servers) unless servers.nil?
        params[:tags] = Array(tags) unless tags.nil?
        params[:q] = q unless q.nil?
        params[:quickFilter] = quick_filter unless quick_filter.nil?
        self.class.get(application_path(app_id, "libraries/filter"), { query: params }) do |response|
          # TODO: build LibrariesResponse
        end
      end

      def application_libraries_filter_by_type app_id, filter_type
        self.class.get(application_path(app_id, "libraries/filter/#{ filter_type }")) do |response|
          # TODO: build AppLibraryFilterCatalogDetailsResponse
        end
      end

      def application_libraries_stats app_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "libraries/stats"), { query: params }) do |response|
          # TODO: build LibrariesStatsResponse
        end
      end

      def application_status_breakdown app_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "breakdown/status"), { query: params }) do |response|
          # TODO: build TraceStatusBreakdownResponse
        end
      end

      def application_trace_breakdown app_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "breakdown/trace"), { query: params }) do |response|
          # TODO: build TraceBreakdownResponse
        end
      end

      def application_trace_rule_breakdown app_id, environment
        params = query_params(nil, nil, nil, nil)
        params[:environment] = environment
        self.class.get(application_path(app_id, "breakdown/trace/rule"), { query: params }) do |response|
          # TODO: build TraceRuleTypeBreakdownResponse
        end
      end

      def application_trace_severity_breakdown app_id, environment
        params = query_params(nil, nil, nil, nil)
        params[:environment] = environment
        self.class.get(application_path(app_id, "breakdown/trace/severity"), { query: params }) do |response|
          # TODO: build TraceSeverityBreakdownResponse
        end
      end

      def application_trace_status_breakdown app_id, environment
        params = query_params(nil, nil, nil, nil)
        params[:environment] = environment
        self.class.get(application_path(app_id, "breakdown/trace/status"), { query: params }) do |response|
          # TODO: TraceEnvStatusBreakdownResponse
        end
      end

      def application_servers app_id, expand = nil, merged = nil, licensed = nil
        params = query_params(expand, nil, merged, nil)
        params[:onlyLicensed] = licensed unless licensed.nil?
        self.class.get(application_path(app_id, "servers"), { query: params }) do |response|
          # TODO: ServersResponse
        end
      end

      def application_servers_breakdown app_id
        self.class.get(application_path(app_id, "servers/breakdown")) do |response|
          # TODO: ApplicationServersBreakdownResponse
        end
      end

      def application_servers_count app_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "servers/count"), { query: params }) do |response|
          # TODO: ApplicationServersResponse
        end
      end

      def application_newest_server app_id, expand = nil, merged = nil
        params = query_params(expand, nil, merged, nil)
        self.class.get(application_path(app_id, "servers/newest"), { query: params }) do |response|
          # TODO: ServerResponse
        end
      end

      def application_servers_properties app_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "servers/properties"), { query: params }) do |response|
          # TODO: ServersPropertiesResponse
        end
      end

      def application_servers_settings app_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "servers/settings"), { query: params }) do |response|
          # TODO: build ApplicationServerSettingsResponse
        end
      end

      def application_servers_settings_by_environment app_id, environment, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "servers/settings/environment"), { query: params }) do |response|
          # TODO: build ApplicationServerSettingsEnvironmentResponse
        end
      end

      def application_technologies app_id
        self.class.get(application_path(app_id, "techs")) do |response|
          # TODO: build ApplicationTechnologiesResponse
        end
      end

      def application_traces_filter app_id, request = nil, expand = nil, limit = nil, offset = nil, sort = nil
        params = query_params(expand, nil, nil, limit)
        params[:request] = request unless request.nil?
        params[:offset] = offset.to_i unless offset.nil?
        params[:sort] = sort unless sort.nil?
        self.class.get(traces_path(app_id, "filter"), { query: params }) do |response|
          # TODO: build TraceFilterResponse
        end
      end

      def application_traces_subfilter app_id, filter_type
        self.class.get(traces_path(app_id, "filter/#{ filter_type }/listing")) do |response|
          # TODO: build TraceFilterCatalogDetailsResponse
        end
      end

      def application_traces_subfilter_keycode_search app_id, filter_type, keycode, form = nil, expand = nil, limit = nil, offset = nil, sort = nil
        params = query_params(expand, nil, nil, limit)
        params[:offset] = offset.to_i unless offset.nil?
        params[:sort] = sort unless sort.nil?
        self.class.get(trace_path(app_id, "filter/#{ filter_type }/#{ keycode }/search")) do |response|
          # TODO: build TraceFilterResponse
        end
      end

      def application_traces_subfilter_keycode_search_simplified app_id, filter_type, keycode, form = nil, expand = nil, sort = nil
        params = query_params(expand, nil, nil, nil)
        params[:form] = form unless form.nil?
        params[:sort] = sort unless sort.nil?
        self.class.get(trace_path(app_id, "filter/#{ filter_type }/#{ keycode }/short"), { query: params }) do |response|
          # TODO: TracesShortResponse
        end
      end

      def application_traces_subfilter_keycode_severities app_id, filter_type, keycode, form = nil
        params = query_params(nil, nil, nil, nil)
        params[:form] = form unless form.nil?
        self.class.get(trace_path(app_id, "filter/#{ filter_type }/#{ keycode }/severities"), { query: params }) do |response|
          # TODO: build TraceFilterCatalogDetailsResponse
        end
      end

      def application_traces_subfilter_keycode_status app_id, filter_type, keycode, form = nil
        params = query_params(nil, nil, nil, nil)
        params[:form] = form unless form.nil?
        self.class.get(trace_path(app_id, "filter/#{ filter_type }/#{ keycode }/status"), { query: params }) do |response|
          # TODO: build TraceFilterCatalogDetailsResponse
        end
      end

      def application_trace app_id, trace_uuid, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(trace_path(app_id, "filter/#{ trace_uuid }"), { query: params }) do |response|
          # TODO: build TraceResponse
        end
      end

      def delete_application_traces app_id
        self.class.delete(trace_path(app_id)) do |response|
          # TODO: build BackgroundJobResponse
        end
      end

      def export_application_traces_csv app_id, request = nil
        params = query_params(nil, nil, nil, nil)

        # TODO: verify that this expects a request object and not just an array of strings
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.post(trace_path(app_id, "export/csv"), { query: params }) do |response|
          # TODO: handle CSV response
        end
      end

      def export_application_traces_csv_all app_id, request = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?

        # TODO: verify that this expects a request object and not just an array of strings
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.post(trace_path(app_id, "export/csv/all"), { query: params }) do |response|
          # TODO: handle CSV response
        end
      end

      def export_application_traces_xml app_id, request = nil
        params = query_params(nil, nil, nil, nil)

        # TODO: verify that this expects a request object and not just an array of strings
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.post(trace_path(app_id, "export/xml"), { query: params }) do |response|
          # TODO: handle XML response
        end
      end

      def export_application_traces_xml_all app_id, request = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?

        # TODO: verify that this expects a request object and not just an array of strings
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.post(trace_path(app_id, "export/xml/all"), { query: params }) do |response|
          # TODO: handle XML response
        end
      end

      def application_trace_uuids app_id, request = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?

        # TODO: verify that this expects a request object and not just an array of strings
        if request
          expect_class!(request, Contrast::UserApi::TraceFilterRequest)
          params[:request] = request
        end

        self.class.get(trace_path(app_id, "ids"), { query: params }) do |response|
          # TODO: build TraceUUIDsResponse
        end
      end

      def application_traces_with_policy_violations app_id, environment = nil
        params = query_params(nil, nil, nil, nil)
        params[:environment] = environment unless environment.nil?
        self.class.get(trace_path(app_id, "policy/violations"), { query: params }) do |response|
          # TODO: build TraceRemediationPolicyViolationsResponse
        end
      end

      def application_traces_quick_filters app_id, request = nil
        params = query_params(nil, nil, nil, nil)
        if request
          expect_class!(request, Contrast::UserApi::TraceFilterRequest)
          params[:request] = request
        end

        self.class.get(trace_path(app_id, "quick"), { query: params }) do |response|
          # TODO: build QuickFilterResponse
        end
      end

      def delete_application_trace app_id, trace_uuid
        self.class.delete(trace_path(app_id, "trace/#{ trace_uuid }")) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def application_trace app_id, trace_uuid, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(trace_path(app_id, "trace/#{ trace_uuid }"), { query: params }) do |response|
          # TODO: build TraceResponse
        end
      end

      def application_trace_requirements app_id, trace_uuid, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(trace_path(app_id, "trace/#{ trace_uuid }/requirements"), { query: params }) do |response|
          # TODO: build TraceRequirementsResponse
        end
      end

      def application_trace_servers app_id, trace_uuid, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(trace_path(app_id, "trace/#{ trace_uuid }/servers"), { query: params }) do |response|
          # TODO: build TraceServerResponse
        end
      end

      def application_trace_url_instances app_id, trace_uuid, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(trace_path(app_id, "trace/#{ trace_uuid }/urlinstances"), { query: params }) do |response|
          # TODO: build TraceUrlInstanceResponse
        end
      end

      def export_application_traces_subfilter_keycode_csv app_id, filter_type, keycode, form = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:form] = form unless form.nil?
        params[:sort] = sort unless sort.nil?
        self.class.post(trace_path(app_id, "#{ filter_type }/#{ keycode }/export/csv"), { query: params }) do |response|
          # TODO: build CSV
        end
      end

      def export_application_traces_subfilter_keycode_xml app_id, filter_type, keycode, form = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:form] = form unless form.nil?
        params[:sort] = sort unless sort.nil?
        self.class.post(trace_path(app_id, "#{ filter_type }/#{ keycode }/export/xml"), { query: params }) do |response|
          # TODO: build XML
        end
      end

      def application_trace_simplified app_id, trace_uuid, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(trace_path(app_id, "#{ trace_uuid }/short"), { query: params }) do
          # TODO: build TraceResponse
        end
      end

      def application_trace_visibility app_id, trace_uuid
        self.class.get(trace_path(app_id, "#{ trace_uuid }/visibility")) do 
          # TODO: build TraceVisibilityResponse
        end
      end
    end
  end
end
