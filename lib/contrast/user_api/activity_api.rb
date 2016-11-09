module Contrast
  module UserApi
    class ActivityApi
      include HTTParty
      include ApiSupport

      attr_reader :version

      def initialize version = "ng"
        @version = version  
      end

      def inactive_activity expand = nil, archived = nil, merged = nil, limit = nil
        params = query_params(expand, archived, merged, limit)
        self.class.get(path("activity/inactive"), { query: params }) do |response|
          # TODO: build ApplicationsResponse object
        end
      end

      def newest_activity expand = nil, archived = nil, merged = nil, limit = nil
        params = query_params(expand, archived, merged, limit)
        self.class.get(path("activity/inactive"), { query: params }) do |response|
          # TODO: build ApplicationsResponse object
        end
      end

      def recent_activity expand = nil, archived = nil, merged = nil, limit = nil
        params = query_params(expand, archived, merged, limit)
        self.class.get(path("activity/recent"), { query: params }) do |response|
          # TODO: build ApplicationsResponse object
        end
      end

      def application_agent_activity app_id, range, merged = nil
        params = query_params(nil, nil, merged, nil)
        self.class.get(application_path(app_id, "agent/activity/#{ range }"), { query: params }) do |response|
          # TODO: build ApplicationAgentActivityResponse object
        end
      end

    end
  end
end
