require 'httparty'

module Contrast
  module UserApi
    class ServersApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version = "ng"
        @version = version
      end

      def servers q = nil, expand = nil, archived = nil
        params = query_params(expand, archived, nil, nil)
        params[:q] = q unless q.nil?
        self.class.get(path("servers"), { query: params }) do |response|
          # TODO
        end
      end
  
      def active_servers
        self.class.get(path("servers/active")) do |response|
          # TODO: 
        end
      end

      def servers_filter log_levels = nil, apps = nil, tags = nil, agent_versions = nil, environments = nil, q = nil, quick_filter = nil, expand = nil, archived = nil, limit = nil, offset = nil, sort = nil
        params = query_params(expand, archived, nil, limit)
        params[:offset] = offset.to_i unless offset.nil?
        params[:sort] = sort unless sort.nil?
        params[:logLevels] = Array(log_levels) unless log_levels.nil?
        params[:applicationIds] = Array(apps) unless apps.nil?
        params[:tags] = Array(tags) unless tags.nil?
        params[:agentVersions] = Array(agent_versions) unless agent_versions.nil?
        params[:environments] = Array(environments) unless environments.nil?
        params[:q] = q unless q.nil?
        params[:quickFilter] = quick_filter unless quick_filter.nil?
        self.class.get(path("servers/filter"), { query: params }) do |response|
          # TODO: 
        end
      end

      def servers_filters
        self.class.get(path("servers/filters/listing")) do |response|
          # TODO: ServerFilterCatalogResponse
        end
      end

      def servers_filters_quick log_levels = nil, apps = nil, tags = nil, agent_versions = nil, environments = nil, q = nil, archived = nil
        params = query_params(nil, archived, nil, nil)
        params[:logLevels] = Array(log_level) unless log_levels.nil?
        params[:applicationIds] = Array(apps) unless apps.nil?
        params[:tags] = Array(tags) unless tags.nil?
        params[:agentVersions] = Array(agent_version) unless agent_versions.nil?
        params[:environments] = Array(environments) unless environments.nil?
        params[:q] = q unless q.nil?
        self.class.get(path("servers/filters/quick"), { query: params }) do |response|
          # TODO: QuickFilterResponse
        end
      end

      def servers_filters_by_type filter_type
        self.class.get(path("servers/filters/#{ filter_type }/listing")) do |response|
          # TODO: ServerFilterCatalogDetailsResponse
        end
      end

      def servers_modes
        self.class.get(path("servers/modes")) do |response|
          # TODO: build ServersAssessDefendResponse
        end
      end
      
      def server server_id, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(server_path(server_id), { query: params }) do |response|
          # TODO: build ServerResponse
        end
      end

      def server_activity server_id, form = nil
        params = query_params(nil, nil, nil, nil)
        params[:form] = form unless form.nil?
        self.class.get(server_path(server_id,  "activity"), { query: params }) do |response|
          # TODO: build ServerActivityResponse
        end
      end

      def server_activity_unity server_id, interval = nil
        params = query_params(nil, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(server_path(server_id, "activity/unity"), { query: params }) do |response|         
          # TODO: build ServerActivityResponse
        end
      end

      def server_apptraces server_id, orphans
        params = query_params(nil, nil, nil, nil)
        params[:orphans] = orphans unless orphans.nil?
        self.class.get(server_path(server_id, "apptraces"), { query: params }) do |response|
          # TODO: build ServerOrphansResponse
        end
      end

      def server_attack_status_breakdown server_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(server_path(server_id, "breakdown/attack/status"), { query: params }) do |response|
          # TODO: build AttackStatusBreakdownResponse
        end
      end

      def server_attack_type_breakdown server_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(server_path(server_id, "breakdown/attack/type"), { query: params }) do |response|
          # TODO: build AttackTypeBreakdownResponse
        end
      end

      def server_attack_rule_breakdown server_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(server_path(server_id, "breakdown/attack/rule"), { query: params }) do |response|
          # TODO: build AttackRuleBreakdownResponse
        end
      end

      def server_attack_severity_breakdown server_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(server_path(server_id, "breakdown/attack/severity"), { query: params }) do |response|
          # TODO: build AttackSeverityBreakdownResponse
        end
      end

      def server_libraries_breakdown server_id, archived = nil, merged = nil
        params = query_params(nil, archived, merged, nil)
        self.class.get(server_path(server_id, "libraries/breakdown"), { query: params }) do |response|
          # TODO: build ServerLibraryBreakdownResponse
        end
      end

      def update_server_name server_id, request
        expect_class!(request, Contrast::UserApi::ServerNameRequest)
        self.class.put(server_path(server_id, "name"), { query: params }) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def server_properties server_id
        self.class.get(server_path(server_id, "properties")) do |response|
          # TODO: build ServerPropertiesResponse
        end
      end

      def server_urls server_id, interval = nil
        params = query_params(nil, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(server_path(server_id, "url"), { query: params }) do |response|
          # TODO: build URLServerBreakdownResponse
        end
      end

      def server_attack_urls server_id, interval = nil
        params = query_params(nil, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(server_path(server_id, "url/attack"), { query: params }) do |response|
          # TODO: build URLServerBreakdownResponse
        end
      end

      def server_vulnerability_urls server_id, interval = nil
        params = query_params(nil, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(server_path(server_id, "url/vuln"), { query: params }) do |response|
          # TODO: build URLServerBreakdownResponse
        end
      end

      def server_libraries server_id, quick_filter = nil, expand = nil
        params = query_params(expand, nil, nil, nil)
        params[:quickFilter] = quick_filter unless quick_filter.nil?
        self.class.get(server_path(server_id, "libraries"), { query: params}) do |response|
          # TODO: build ServersResponse
        end
      end

      def server_libraries_by_filter server_id, apps = nil, tags = nil, q = nil, quick_filter = nil, expand = nil
        params = query_params(expand, nil, nil, nil)
        params[:apps] = Array(apps) unless apps.nil?
        params[:tags] = Array(tags) unless tags.nil?
        params[:q] = q unless q.nil?
        params[:quickFilter] = quick_filter unless quick_filter.nil?
        self.class.get(server_path(server_id, "libraries/filter"), { query: params }) do |response|
          # TODO: build ServersResponse
        end
      end

      def server_libraries_by_subfilter server_id, filter_type
        self.class.get(server_path(server_id, "libraries/filters/#{ filter_type }")) do |response|
          # TODO: build LibraryFilterCatalogDetailsResponse
        end
      end

      def server_library_stats server_id, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(server_path(server_id, "libraries/stats"), { query: params }) do |response|
          # TODO: build LibrariesStatsResponse
        end
      end

      def delete_server_traces server_id
        self.class.delete(path("servertraces/#{ server_id }")) do |response|
          # TODO: build BackgroundJobResponse
        end
      end

      def export_server_traces_csv server_id, request = nil
        params = query_params(nil, nil, nil, nil)
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.post(path("servertraces/#{ server_id }/export/csv"), { query: params }) do |response|
          # CSV
        end
      end

      def export_server_traces_csv_all server_id, request = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?
        
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.post(path("servertraces/#{ server_id }/export/csv/all"), { query: params }) do |response|
          # CSV
        end
      end

      def export_server_traces_xml server_id, request = nil
        params = query_params(nil, nil, nil, nil)
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.post(path("servertraces/#{ server_id }/export/xml"), { query: params }) do |response|
          # XML
        end
      end

      def export_server_traces_xml_all server_id, request = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?
        
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.post(path("servertraces/#{ server_id }/export/xml/all"), { query: params }) do |response|
          # XML
        end
      end

      def server_trace_uuids server_id, request = nil, sort = nil
        params = query_params(nil, nil, nil, nil)
        params[:sort] = sort unless sort.nil?
        
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.get(path("servertraces/#{ server_id }/ids"), { query: params }) do |response|
          # TODO: build TraceUUIDsResponse
        end
      end

      def server_traces_with_policy_violations server_id
        self.class.get(path("servertraces/#{ server_id }/policy/violations")) do |response|
          # TODO: build TraceRemediationPolicyViolationsResponse
        end
      end

      def server_traces_quick_filters server_id, request = nil
        params = query_params(nil, nil, nil, nil)
        
        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.get(path("servertraces/#{ server_id }/quick")) do |response|
          # TODO: build QuickFilterResponse
        end
      end

      def delete_server_trace server_id, trace_uuid
        self.class.delete(path("servertraces/#{ server_id }/trace/#{ trace_uuid }")) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def server_trace_simplified server_id, trace_uuid, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(path("servertraces/#{ server_id }/#{ trace_uuid }/short"), { query: params }) do |response|
          # TODO: build TraceShortResponse
        end
      end

      def server_trace_visibility server_id, trace_uuid 
        self.class.get(path("servertraces/#{ server_id }/#{ trace_uuid }/visibility")) do |response|
          # TODO: build TraceVisibilityResponse
        end
      end

      def server_traces server_id, request = nil, expand = nil, limit = nil, offset = nil, sort = nil
        params = query_params(expand, nil, nil, limit)
        params[:offset] = offset.to_i unless offset.nil?
        params[:sort] = sort unless sort.nil

        if request
          expect_class!(request, Contrast::UserApi::TraceBaseRequest)
          params[:request] = request
        end

        self.class.get(path("servertraces/#{ server_id }/filter"), { query: params }) do |response|
          # TODO: build TraceFilterResponse
        end
      end

      def server_trace_filter_listing server_id, filter_type
        self.class.get(path("servertraces/#{ server_id }/filter/#{ filter_type }/listing")) do |response|
          # TODO: build TraceFilterCatalogDetailsResponse
        end
      end

      def server_trace server_id, trace_uuid, expand = nil
        params = query_params(expand, nil, nil, nil)
        self.class.get(path("servertraces/#{ server_id }/filter/#{ trace_uuid }"), { query: params }) do |response|
          # TODO
        end
      end


    end
  end
end
