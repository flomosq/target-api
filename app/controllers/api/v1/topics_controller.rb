module Api
  module V1
    class TopicsController < ApplicationController
      def index
        @topics = Topic.all
        render json: { topics: @topics }
      end
    end
  end
end
