require 'rails_helper'

RSpec.describe 'DELETE api/v1/users/sign_out', type: :request do
  let(:user) { create(:user) }

  subject { delete destroy_user_session_path, headers: auth_headers }

  it 'returns a successful response' do
    subject

    expect(response).to be_successful
  end
end
