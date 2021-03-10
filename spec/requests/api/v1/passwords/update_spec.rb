RSpec.describe 'PUT api/v1/users/password', type: :request do
  let(:user) { create(:user) }
  let(:reset_password_token) { user.send(:set_reset_password_token) }

  let(:headers) { auth_headers(user) }

  subject { put user_password_path, params: params, headers: headers }

  context 'when the request is correct' do
    let(:params) do
      {
        password: 'password',
        password_confirmation: 'password'
      }
    end

    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end
  end
end
