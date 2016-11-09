require 'httparty'

module Contrast
  module UserApi
    class HistoryApi
      include HTTParty
      include ApiSupport

      attr_reader :version

      def initialize version = "ng"
        @version = version  
      end

      def history_scores limit = nil
        params = query_params(nil, nil, nil, limit)
        self.class.get(path("history/scores"), { query: params }) do |response|
          # TODO: build HistoryScoresResponse
        end
      end

      def history_scores_by_interval interval
        params = query_params(nil, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(path("history/scores/interval"), { query: params }) do |response|
          # TODO: build HistoryScoresResponse
        end
      end

      def history_scores_with_defense_by_interval interval
        params = query_params(nil, nil, nil, nil)
        params[:interval] = interval unless interval.nil?
        self.class.get(path("history/scores/interval/defense"), { query: params }) do |response|
          # TODO: build HistoryScoresResponse
        end
      end
    end
  end
end
