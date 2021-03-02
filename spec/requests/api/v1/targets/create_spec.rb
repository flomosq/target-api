RSpec.describe 'POST api/v1/targets', type: :request do
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:target) { attributes_for(:target, topic_id: topic.id) }

  let!(:params) { { target: target } }

  let!(:headers) { auth_headers }

  subject { post api_v1_targets_path, params: params, headers: headers }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end

    it 'creates the target' do
      expect {
        subject
      }.to change(Target, :count).by(1)
    end

    it 'returns the target' do
      subject

      expect(json).to include_json(
        target: {
          topic: { id: topic.id, name: topic.name },
          title: target[:title],
          radius: target[:radius]
        }
      )
      expect(json[:target][:latitude].to_f).to be_within(0.00001).of(target[:latitude])
      expect(json[:target][:longitude].to_f).to be_within(0.00001).of(target[:longitude])
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
