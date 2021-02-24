require 'rails_helper'

RSpec.describe 'POST api/v1/users/sign_in', type: :request do
  let(:user) { create(:user) }
  before { user }

  let(:email) { 'test@test.com' }
  let(:password) { '12345678' }

  let(:params) do
    {
      email: email,
      password: password
    }
  end

  subject { post user_session_path, params: params }

  it 'returns a successful response' do
    subject

    expect(response).to be_successful
  end

  it 'returns the user' do
    subject

    expect(json[:data]).to match(a_hash_including(email: user.email, gender: user.gender,
                                                  id: user.id, uid: user.uid))
  end

  it 'returns valid client and access token' do
    subject

    token = response.header['access-token']
    client = response.header['client']

    expect(user.reload.valid_token?(token, client)).to be_truthy
  end

  context 'when given incorrect params' do
    let(:password) { 'wrong_pass' }

    it 'returns unauthorized' do
      subject

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
