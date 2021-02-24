require 'rails_helper'

RSpec.describe 'POST /auth', type: :request do
  let(:email) { 'test@test.com' }
  let(:password) { '12345678' }
  let(:password_confirmation) { '12345678' }
  let(:gender) { 'female' }
  
  let(:params) do
    {
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      gender: gender
    }
  end

  subject { post user_registration_path, params: params }

  it 'returns a successful response' do
    subject

    expect(response).to have_http_status(:ok)
  end

  it 'creates the user' do
    expect {
      subject
    }.to change(User, :count).by(1)
  end

  it 'returns the user' do
    subject

    expect(json[:data]).to match(a_hash_including(email: email, gender: gender))
  end

end
