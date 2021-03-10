RSpec.describe 'PUT api/v1/users/password', type: :request do
  let(:user) { create(:user) }

  let(:headers) { auth_headers(user) }

  subject { put user_password_path, params: params, headers: headers, as: :json }

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
    let(:password) { Faker::Internet.password(min_length: 1, max_length: 5) }
    let(:params) do
      {
        password: password,
        password_confirmation: password
      }
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message' do
      subject

      expect(json[:errors]).to include(password: include('is too short (minimum is 6 characters)'))
    end

    it 'does not update the user' do
      expect {
        subject
      }.not_to change { user.password }
    end
  end

  context 'when the password is too long' do
    let(:password) { Faker::Internet.password(min_length: 129) }
    let(:params) do
      {
        password: password,
        password_confirmation: password
      }
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message' do
      subject

      expect(json[:errors]).to include(password: include('is too long (maximum is 128 characters)'))
    end

    it 'does not update the user' do
      expect {
        subject
      }.not_to change { user.password }
    end
  end

  context 'when the passwords do not match' do
    let(:params) do
      {
        password: 'password',
        password_confirmation: 'password_confirmation'
      }
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'returns an error message' do
      subject

      expect(json[:errors]).to include(password_confirmation: include("doesn't match Password"))
    end

    it 'does not update the user' do
      expect {
        subject
      }.not_to change { user.password }
    end
  end
end
