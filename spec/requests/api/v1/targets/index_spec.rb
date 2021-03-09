RSpec.describe 'GET api/v1/targets', type: :request do
  let(:user) { create(:user) }
  let!(:user_targets) { create_list(:target, 4, user: user) }
  let!(:other_targets) { create_list(:target, 6) }

  let!(:headers) { auth_headers(user) }

  subject { get api_v1_targets_path, headers: headers, as: :json }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end

    it "returns the user's targets" do
      subject

      expect(json[:targets].count).to eq(4)
    end

    it 'returns the correct data' do
      subject

      expect(json[:targets]).to all(include(*%w[id title radius latitude longitude topic]))
    end
  end

  context 'when given incorrect headers' do
    let!(:headers) { {} }

    it 'returns unauthorized' do
      subject

      expect(response).to be_unauthorized
    end
  end
end
