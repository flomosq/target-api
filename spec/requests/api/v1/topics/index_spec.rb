require 'rails_helper'

RSpec.describe 'GET api/v1/topics', type: :request do
  let(:user) { create(:user) }
  let(:topics) do
    [
      create(:topic),
      create(:topic),
      create(:topic)
    ]
  end

  subject { get api_v1_topics_path, headers: auth_headers }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end
  end
end
