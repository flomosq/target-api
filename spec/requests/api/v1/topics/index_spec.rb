RSpec.describe 'GET api/v1/topics', type: :request do
  let(:user) { create(:user) }
  let!(:topics) { create_list(:topic, 3) }

  subject { get api_v1_topics_path, headers: headers, as: :json }

  context 'when the request is correct' do
    let!(:headers) { auth_headers(user) }

    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end

    it 'returns a list of topics' do
      subject

      topics_list = json[:topics]

      expect(topics_list.count).to eq(3)
    end

    it 'returns the existing topics' do
      subject

      topics_list = json[:topics]
      existing_topics_data = topics.map { |topic| { id: topic.id, name: topic.name } }

      expect(topics_list).to include_unordered_json(existing_topics_data)
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
