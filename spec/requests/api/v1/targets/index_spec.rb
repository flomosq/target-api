RSpec.describe 'GET api/v1/targets', type: :request do
  let(:user) { create(:user) }
  let!(:user_targets) { create_list(:target, 4, user: user) }
  let!(:other_targets) { create_list(:target, 6) }

  let!(:headers) { auth_headers }

  subject { get api_v1_targets_path, headers: headers }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end
  end
end
