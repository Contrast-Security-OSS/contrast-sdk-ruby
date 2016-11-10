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
        self.class.get(agents_path('profiles'), params)
      end

      def profile name, expand = false
        params = expand ? { query: { expand: true } } : {}
        self.class.get(agents_path("profiles/#{ name }"), params)
      end

      def create_profile agent_profile_request
        expect_class!(agent_profile_request, Contrast::UserApi::AgentProfileRequest)

        body = { body: agent_profile_request.to_hash }
        self.class.post(agents_path('profiles'), body)
      end

      def update_profile name, agent_profile_request
        expect_class!(agent_profile_request, Contrast::UserApi::AgentProfileRequest)

        body = { body: agent_profile_request.to_hash }
        self.class.put(agents_path("profiles/#{ name }"), body)
      end

      def versions 
        self.class.get(agents_path("profiles/versions"))
      end

      def agent name, platform
        self.class.get(agents_path("profiles/#{ name }/#{ platform }"))
      end

      private

        def agents_path path
           value_required!(path)
           path("agents/#{ path }")
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

