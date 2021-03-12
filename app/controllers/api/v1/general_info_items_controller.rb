module Api
  module V1
    class GeneralInfoItemsController < ApiController
      skip_before_action :authenticate_user!

      def about
        @about = GeneralInfoItem.find_by!(name: 'about')
      end
    end
  end
end
