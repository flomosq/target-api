module Api
  module V1
    class TargetsController < ApiController
      def create
        @target = user_targets.create!(target_params)
        render :show
      end

      private

      def user_targets
        current_user.targets
      end

      def target_params
        params.require(:target).permit(:topic_id, :title, :radius, :latitude, :longitude)
      end
    end
  end
end
