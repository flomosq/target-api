RSpec.describe 'POST api/v1/targets', type: :request do
  let(:user) { create(:user) }
  let(:contact) { attributes_for(:contact) }

  let(:params) { { contact: contact } }

  let(:headers) { auth_headers(user) }

  subject { post api_v1_contacts_path, params: params, headers: headers, as: :json }

  context 'when the request is correct' do
    it 'returns a no content response' do
      subject

      expect(response).to be_no_content
    end
  end
end
