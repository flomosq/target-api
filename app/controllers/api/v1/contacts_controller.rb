module Api
  module V1
    class ContactsController < ApiController
      def create
        Contact.create!(contact_params)
      end

      private

      def contact_params
        params.require(:contact).permit(:email, :message)
      end
    end
  end
end
