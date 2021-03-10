require 'rails_helper'

describe 'GET api/v1/users/password/edit', type: :request do
  let(:user) { create(:user, password: 'mypass123') }
  let(:password_token) { user.send(:set_reset_password_token) }

  let(:params) do
    {
      reset_password_token: password_token,
      redirect_url: ''
    }
  end

  subject { get edit_user_password_path, params: params }

  context 'when given the correct data' do
    it 'is a redirection' do
      subject

      expect(response).to be_redirection
    end

    it 'returns the access token, the uid and the client id' do
      subject

      expect(response.header['Location']).to include('access-token', 'uid', 'client_id')
    end
  end
end
