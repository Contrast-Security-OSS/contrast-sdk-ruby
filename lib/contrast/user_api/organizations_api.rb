require 'httparty'

module Contrast
  module UserApi
    class OrganizationsApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version
        @version = version
      end

      def organization
        self.class.get(path("organizations")) do |response|
          # TODO: build OrganizationResponse
        end
      end

      def organization_administrators
        self.class.get(path("organizations/administrators")) do |response|
          # TODO: build OrganizationAdminResponse
        end
      end

      def organization_apikey
        self.class.get(path("organizations/apikey")) do |response|
          # TODO: build UserApiKeyResponse
        end
      end

      def organization_application_roles
        self.class.get(path("organizations/application/roles")) do |response|
          # TODO: ApplicationsRoleResponse
        end
      end

      def server_need_restart_on_change language
        self.class.get(path("organizations/servers/restart/#{ language }")) do |response|
          # TODO: build ServerBaseResponse
        end
      end

      def organization_application_stats interval = nil, expand = nil
        params = query_params(expand, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(path("organizations/stats/application"), { query: params }) do |response|
          # TODO: build OrganizationApplicationStatsResponse
        end
      end

      def organization_library_stats interval = nil, expand = nil
        params = query_params(expand, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(path("organizations/stats/library"), { query: params }) do |response|
          # TODO: build OrganizationLibraryStatsResponse
        end
      end

      def organization_server_stats interval = nil, expand = nil
        params = query_params(expand, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(path("organizations/stats/server"), { query: params }) do |response|
          # TODO: build OrganizationServerStatsResponse
        end
      end

      def organization_trace_stats interval = nil
        params = query_params(nil, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(path("organizations/stats/trace"), { query: params }) do |response|
          # TODO: build OrganizationTraceStatsResponse
        end
      end

      def server_settings
        self.class.get(path("server/settings")) do |response|
          # TODO: build ServerSettingsResponse
        end
      end

      def update_server_settings settings 
        expect_class!(settings, Contrast::UserApi::ServerSettingsRequest)

        self.class.put(path("server/settings"), { body: settings }) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def update_assess_settings settings
        # TODO: no class listed in documentation
        # expect_class!(settings, Contrast::UserApi::...

        self.class.put(path("server/settings/assess"), { body: settings }) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def update_bot_protection_settings settings
        # TODO: no class listed in documentation
        # expect_class!(settings, Contrast::UserApi::...

        self.class.put(path("server/settings/botblocking"), { body: settings }) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def update_defend_settings settings
        # TODO: no class listed in documentation
        # expect_class!(settings, Contrast::UserApi::...

        self.class.put(path("server/settings/defend"), { body: settings }) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def organization_search q
        params = query_params(nil, nil, nil, nil)
        params[:q] = q 
        self.class.get(path("search"), { query: params }) do |response|
          # TODO: build OrganizationSearchResultsResponse
        end
      end
    end
  end
end
