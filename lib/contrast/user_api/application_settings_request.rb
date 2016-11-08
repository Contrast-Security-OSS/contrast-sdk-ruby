module Contrast
  module UserApi
    class ApplicationSettingsRequest
      attr_accessor :code,
          :display_name,
          :importance,
          :notes,
          :override_url
    end
  end
end
