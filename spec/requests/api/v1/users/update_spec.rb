RSpec.describe 'PUT api/v1/users', type: :request do
  let(:user) { create(:user) }
  let!(:params) { attributes_for(:user, :with_name, :male).extract!(:name, :gender) }

  let!(:headers) { auth_headers }

  subject { put user_registration_path, params: params, headers: headers }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end
  end
end
