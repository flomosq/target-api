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

    it 'sends an email' do
      expect {
        subject
      }.to change(ActionMailer::Base.deliveries, :count).by(1)
    end
  end

  context 'when given a non existent email' do
    let(:email) { 'non_existent_email' }

    it 'returns a not found response' do
      subject

      expect(response).to be_not_found
    end
  end
end
