module Contrast
  module UserApi
    class AgentProfileResource
      attr_accessor :name,  # string
          :engine_type,     # string
          :log_file,        # string
          :log_level,       # string
          :log_stdout,      # boolean
          :log_to_file,     # boolean
          :sampling,        # boolean, sampling enabled
          :sampling_baseline,
          :sampling_frequency,
          :sampling_window,
          :stacktrace_capture_mode, # string
          :use_proxy,       # boolean
          :proxy_host,
          :proxy_port,
          :proxy_auth,
          :proxy_user
    end
  end
end
