module Api
  module V1
    class TargetsController < ApiController
      def index
        @targets = user_targets
      end

      def create
        @target = user_targets.create!(target_params)
        render :show
      end

      def destroy
        current_target.destroy!
      end

      private

      def current_target
        user_targets.find(params[:id])
      end

      def user_targets
        current_user.targets
      end

      def target_params
        params.require(:target).permit(:topic_id, :title, :radius, :latitude, :longitude)
      end
    end
  end
end
