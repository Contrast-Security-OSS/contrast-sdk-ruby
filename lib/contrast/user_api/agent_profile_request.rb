module Contrast
  module UserApi 
    class AgentProfileRequest
      attr_accessor :engine_type,
          :name,
          :proxy_auth,
          :proxy_host,
          :proxy_pass,
          :proxy_port,
          :proxy_user,
          :use_proxy
    end
  end
end
