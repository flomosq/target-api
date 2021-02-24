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

    expect(response).to be_successful
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

  context 'when the email is not correct' do
    let(:email) { 'invalid_email' }

    it 'does not create the user' do
      expect {
        subject
      }.not_to change(User, :count)
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'when the password is too short' do
    let(:password) { 'short' }

    it 'does not create the user' do
      expect {
        subject
      }.not_to change(User, :count)
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'when the password is too long' do
    let(:password) { 'thisisaverylongpassword' }

    it 'does not create the user' do
      expect {
        subject
      }.not_to change(User, :count)
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'when the passwords do not match' do
    let(:password) { 'password' }
    let(:password_confirmation) { 'password_confirmation' }

    it 'does not create the user' do
      expect {
        subject
      }.not_to change(User, :count)
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'when the gender is not correct' do
    let(:gender) { 'gender' }

    it 'does not create the user' do
      expect {
        subject
      }.not_to change(User, :count)
    end

    it 'does not return a successful response' do
      subject

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
