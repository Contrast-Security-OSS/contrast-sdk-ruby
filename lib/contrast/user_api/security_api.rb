require 'httparty'

module Contrast
  module UserApi
    class SecurityApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version = "ng"
        @version = version
      end

      def controls
        self.class.get(path("controls")) do |response|
          # TODO: build SecurityControlsResponse
        end
      end

      def sanitizer_controls
        self.class.get(path("controls/sanitizers")) do |response|
          # TODO: build SecuritySanitizersResponse
        end
      end

      def sanitizer_control sanitizer_id
        self.class.get(path("controls/sanitizer/#{ sanitizer_id }")) do |response|
          # TODO: build SecuritySanitizerResponse
        end
      end

      def create_sanitizer_control control
        expect_class!(control, Contrast::UserApi::SecurityControlRequest)
        self.class.post(path("controls/sanitizers"), { body: control }) do |response|
          # TODO: build SecuritySanitizerResponse
        end
      end

      def update_sanitizer_control sanitizer_id, control
        expect_class!(control, Contrast::UserApi::SecurityControlRequest)
        self.class.put(path("controls/sanitizers/#{ sanitizer_id }")) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def toggle_sanitizer_control sanitizer_id
        self.class.put(path("controls/sanitizers/#{ sanitizer_id }/enabled")) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def delete_sanitizer_control sanitizer_id
        self.class.delete(path("controls/sanitizers/#{ sanitizer_id }")) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def control_suggestions
        self.class.get(path("controls/suggestion")) do |response|
          # TODO: build SecurityControlSuggestionsResponse
        end
      end

      def create_sanitizer_control_suggestion possible_sanitizer_id, suggestion
        expect_class!(suggestion, Contrast::UserApi::SecurityControlSuggestionRequest)
        self.class.post(path("controls/suggestion/sanitizers/#{ possible_sanitizer_id }"), { body: suggestion }) do |response|
          # TODO: build SecurityControlResponse
        end
      end

      def undo_sanitizer_control_suggestion possible_sanitizer_id
        self.class.put(path("controls/suggestion/sanitizers/#{ possible_sanitizer_id }")) do |response|
          # TODO: build SecurityControlSuggestionResponse
        end
      end

      def delete_sanitizer_control_suggestion possible_sanitizer_id
        self.class.delete(path("controls/suggestion/sanitizers/#{ possible_sanitizer_id }")) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def create_validator_control_suggestion possible_validator_id, suggestion
        expect_class!(suggestion, Contrast::UserApi::SecurityControlSuggestionRequest)
        self.class.post(path("controls/suggestion/validators/#{ possible_validator_id }"), { body: suggestion }) do |response|
          # TODO: build SecurityControlResponse
        end
      end

      def undo_validator_control_suggestion possible_validator_id
        self.class.put(path("controls/suggestion/validators/#{ possible_validator_id }")) do |response|
          # TODO: build SecurityControlSuggestionResponse
        end
      end

      def delete_validator_control_suggestion possible_validator_id
        self.class.delete(path("controls/suggestion/validators/#{ possible_validator_id }")) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def validator_control validator_id
        self.class.get(path("controls/validator/#{ validator_id }")) do |response|
          # TODO: build SecurityValidatorResponse
        end
      end

      def validator_controls
        self.class.get(path("controls/validators")) do |response|
          # TODO: build SecurityValidatorsResponse
        end
      end

      def create_validator_control control
        expect_class!(control, Contrast::UserApi::SecurityControlRequest)
        self.class.post(path("controls/validators"), { body: control }) do |response|
          # TODO: build SecurityValidatorResponse
        end
      end

      def update_validator_control validator_id, control
        expect_class!(control, Contrast::UserApi::SecurityControlRequest)
        self.class.put(path("controls/validators/#{ validator_id }"), { body: control }) do |response|
          # TODO: build SecurityValidatorResponse
        end
      end

      def delete_validator_control validator_id
        self.class.delete(path("controls/validators/#{ validator_id }")) do |response|
          # TODO: build BaseApiResponse
        end
      end

      def toggle_validator_control validator_id
        self.class.put(path("controler/validators/#{ validator_id }/enabled")) do |response|
          # TODO: build BaseApiResponse
        end
      end
    end
  end
end
