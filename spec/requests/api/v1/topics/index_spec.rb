require 'rails_helper'

RSpec.describe 'GET api/v1/topics', type: :request do
  let(:user) { create(:user) }
  let!(:topics) { create_list(:topic, 3) }

  subject { get api_v1_topics_path, headers: auth_headers }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end

    it 'returns a list of topics' do
      subject

      topics = json[:topics]

      expect(topics.length).to eq 3
    end
  end

  context 'when given incorrect headers' do
    let!(:auth_headers) { {} }

    it 'returns unauthorized' do
      subject

      expect(response).to be_unauthorized
    end
  end
end
