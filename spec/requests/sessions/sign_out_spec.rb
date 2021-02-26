require 'rails_helper'

RSpec.describe 'DELETE api/v1/users/sign_out', type: :request do
  let(:user) { create(:user) }

  subject { delete destroy_user_session_path, headers: @req_headers }

  context 'when given correct headers' do
    before(:each) do
      @req_headers = create_auth_headers
    end

    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end

    it 'decreases the amount of user tokens' do
      expect {
        subject
      }.to change { user.reload.tokens.size }.by(-1)
    end
  end

  context 'when given incorrect headers' do
    @req_headers = {}

    it 'returns unauthorized' do
      subject

      expect(response).to be_not_found
    end
  end
end
