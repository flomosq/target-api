RSpec.describe 'POST api/v1/targets', type: :request do
  let(:user) { create(:user) }
  let(:contact) { attributes_for(:contact) }

  let(:params) { { contact: contact } }

  let(:headers) { auth_headers(user) }

  subject { post api_v1_contacts_path, params: params, headers: headers, as: :json }

  context 'when the request is correct' do
    let(:newest_contact) { Contact.last }

    it 'returns a no content response' do
      subject

      expect(response).to be_no_content
    end

    it 'creates the contact' do
      expect {
        subject
      }.to change(Contact, :count).by(1)
    end

    it 'creates the contact with the correct data' do
      subject

      expect(newest_contact.email).to eq(contact[:email])
      expect(newest_contact.message).to eq(contact[:message])
    end

    it 'enqueues an email delivery job' do
      expect {
        subject
      }.to have_enqueued_job.on_queue('default')
    end
  end

  context 'when missing any of the required values' do
    let(:contact) { attributes_for(:contact, email: nil) }

    it 'returns bad request' do
      subject

      expect(response).to be_bad_request
    end

    it 'returns an error message' do
      subject

      expect(json[:errors]).to include(email: include("can't be blank"))
    end

    it 'does not enqueue an email delivery job' do
      expect {
        subject
      }.not_to have_enqueued_job
    end

    it 'does not create the contact' do
      expect {
        subject
      }.not_to change(Contact, :count)
    end
  end
end
