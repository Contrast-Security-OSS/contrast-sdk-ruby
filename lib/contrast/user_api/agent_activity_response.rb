module Contrast
  module UserApi
    class AgentActivityResponse < Response
      attr_accessor :activities, :errors
    end
  end
end
