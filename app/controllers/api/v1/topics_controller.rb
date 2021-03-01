module Api
  module V1
    class TopicsController < ApplicationController
      before_action :authenticate_user!

      def index
        @topics = Topic.all
        render json: @topics
      end
    end
  end
end
