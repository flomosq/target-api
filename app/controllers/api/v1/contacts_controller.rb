module Api
  module V1
    class ContactsController < ApiController
      def create
        Contact.create!(contact_params)
        ContactMailer.contact(
          contact_params[:email],
          contact_params[:message]
        ).deliver_later
      end

      private

      def contact_params
        params.require(:contact).permit(:email, :message)
      end
    end
  end
end
