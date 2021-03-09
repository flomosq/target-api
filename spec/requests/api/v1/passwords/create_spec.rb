RSpec.describe 'POST api/v1/users/password', type: :request do
  let(:user) { create(:user) }
  let(:email) { user.email }

  let(:params) { { email: email, redirect_url: '' } }

  subject { post user_password_path, params: params }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end
  end
end
