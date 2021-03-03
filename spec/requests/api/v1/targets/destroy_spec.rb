RSpec.describe 'POST api/v1/targets', type: :request do
  let(:user) { create(:user) }
  let!(:target) { create(:target, user: user) }

  let(:headers) { auth_headers }

  subject { delete api_v1_target_path(target.id), headers: headers }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end

    it 'decreases the targets count' do
      expect {
        subject
      }.to change(Target, :count).by(-1)
    end
  end
end
