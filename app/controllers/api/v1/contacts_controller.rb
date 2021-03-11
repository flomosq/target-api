module Api
  module V1
    class ContactsController < ApiController
      skip_before_action :authenticate_user!

      def create
        contact = Contact.create!(contact_params)
        ContactMailer.contact(
          contact.email,
          contact.message
        ).deliver_later
      end

      private

      def contact_params
        params.require(:contact).permit(:email, :message)
      end
    end
  end
end
