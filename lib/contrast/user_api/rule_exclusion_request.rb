module Contrast
  module UserApi
    class RuleExclusionRequest
      attr_accessor :all_assessment_rules,
          :all_protection_rules,
          :all_rules,
          :assessment_rules,
          :codes,
          :event_uuid,
          :input_name,
          :input_type,
          :name,
          :protection_rules,
          :rules,
          :type,
          :url_pattern_type,
          :urls
    end
  end
end

