require 'httparty'

module Contrast
  module UserApi
    class ScoresApi
      include HTTParty
      include ApiSupport

      attr_accessor :version

      def initialize version = 'ng'
        @version = version
      end

      def scores
        self.class.get(path('scores')) do |response|
          # TODO: build ScoreResponse
        end
      end

      def scores_breakdown_category
        self.class.get(path("scores/breakdown/category")) do |response|
          # TODO: build RuleCategoryBreakdownResponse
        end
      end

      def scores_breakdown_rule
        self.class.get(path("scores/breakdown/rule")) do |response|
          # TODO: build RuleTitleBreakdownResponse
        end
      end

      def scores_breakdown_server
        self.class.get(path("scores/breakdown/server")) do |response|
          # TODO: build ServerTypeBreakdownResponse
        end
      end

      def scores_breakdown_severity
        self.class.get(path("scores/breakdown/severity")) do |response|
          # TODO: build RuleSeverityBreakdownResponse
        end
      end

      def scores_breakdown_status
        self.class.get(path("scores/breakdown/status")) do |response|
          # TODO: build TraceStatusBreakdownResponse
        end
      end

      def scores_breakdown_trace
        self.class.get(path("scores/breakdown/trace")) do |response|
          # TODO: build TraceBreakdownResponse
        end
      end

      def scores_breakdown_trace_rule
        self.class.get(path("scores/breakdown/trace/rule")) do |response|
          # TODO: build TraceRuleTypeBreakdownResponse
        end
      end

      def scores_breakdown_trace_severity
        self.class.get(path("scores/breakdown/trace/severity")) do |response|
          # TODO: TraceSeverityBreakdownResponse
        end
      end

      def scores_breakdown_trace_status
        self.class.get(path("scores/breakdown/trace/status")) do |response|
          # TODO: TraceEnvStatusBreakdownResponse
        end
      end

      def platform_score
        self.class.get(path("scores/platform")) do |response|
          # TODO: build ScoreMetricResponse
        end
      end

      def platform_score_with_defense
        self.class.get(path("scores/platform/defense")) do |response|
          # TODO: build ScoreMetricResponse
        end
      end

      def organization_security_score
        self.class.get(path("scores/security")) do |response|
          # TODO: build SecurityScoreMetricResponse
        end
      end

      def organization_security_score_with_defense
        self.class.get(path("scores/security/defense")) do |response|
          # TODO: biuld SecurityScoreMetricResponse
        end
      end
    end
  end
end
