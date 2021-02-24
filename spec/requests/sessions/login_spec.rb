require 'rails_helper'
include ActionController::RespondWith

RSpec.describe 'POST api/v1/users/sign_in', type: :request do
  let(:user) { create(:user) }
  before { user }

  let(:email) { 'test@test.com' }
  let(:password) { '12345678' }

  let(:params) do
    {
      email: email,
      password: password,
    }
  end

  subject { post user_session_path, params: params }

  it 'returns a successful response' do
    subject

    expect(response).to be_successful
  end
end
