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

    it 'updates the user' do
      expect {
        subject
      }.to change { user.updated_at }
    end
  end

  context 'when the password is too short' do
    let(:params) do
      {
        password: 'short',
        password_confirmation: 'short'
      }
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'is expected an error message' do
      subject

      expect(json).to have_key(:errors)
    end

    it 'does not update the user' do
      expect {
        subject
      }.not_to change { user.password }
    end
  end

  context 'when the password is too long' do
    let(:params) do
      {
        password: 'thisisaverylongpassword',
        password_confirmation: 'thisisaverylongpassword'
      }
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
