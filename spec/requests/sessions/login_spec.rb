require 'rails_helper'

RSpec.describe 'POST api/v1/users/sign_in', type: :request do
  let(:user) { create(:user) }

  let(:email) { user.email }
  let(:password) { user.password }

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

    Approvals.verify(response.body, name: 'logged_in_user', format: :json)
    expect(json[:data]).to include(
      email: user.email,
      id: user.id,
      uid: user.uid
    )
  end

  it 'returns valid client and access token' do
    subject

    token = response.header['access-token']
    client = response.header['client']

    expect(user.reload.valid_token?(token, client)).to be true
  end

  context 'when given incorrect params' do
    let(:password) { 'wrong_pass' }

    it 'returns unauthorized' do
      subject

      expect(response).to be_unauthorized
    end
  end
end
