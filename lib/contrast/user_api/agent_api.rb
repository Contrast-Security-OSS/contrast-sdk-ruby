require 'httparty'

module Contrast
  module UserApi
    class AgentApi
      include HTTParty
      include ApiSupport

      attr_reader :version

      def initialize version = "ng"
        @version = version  
      end

      def profiles expand = false
        params = expand ? { query: { expand: true } } : {}
        self.class.get(path('profiles'), params)
      end

      def profile name, expand = false
        params = expand ? { query: { expand: true } } : {}
        self.class.get(path("profiles/#{ name }"), params)
      end

      def create_profile agent_profile_request
        expect_class!(agent_profile_request, Contrast::UserApi::AgentProfileRequest)

        body = { body: agent_profile_request.to_hash }
        self.class.post(path('profiles'), body)
      end

      def update_profile name, agent_profile_request
        expect_class!(agent_profile_request, Contrast::UserApi::AgentProfileRequest)

        body = { body: agent_profile_request.to_hash }
        self.class.put(path("profiles/#{ name }"), body)
      end

      def versions 
        self.class.get(path("profiles/versions"))
      end

      def agent name, platform
        self.class.get(path("profiles/#{ name }/#{ platform }"))
      end

      private

        def path path 
          org_uuid_required!
          value_required!(path)

          "/#{ version }/#{ org_uuid }/agents/#{ path }"
        end

        def profile_path name, path
          org_uuid_required!
          value_required!(name, "Profile name")
          value_required!(path)

          "/#{ version }/#{ org_uuid }/agents/profiles/#{ name }/#{ path }"
        end
    end
  end
end

