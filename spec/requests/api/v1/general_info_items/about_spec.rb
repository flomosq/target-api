RSpec.describe 'GET api/v1/about', type: :request do
  let!(:about_info) { create(:general_info_item, name: 'about') }

  subject { get api_v1_about_path, as: :json }

  it 'returns a successful response' do
    subject

    expect(response).to be_successful
  end

  it 'returns the corresponding information' do
    subject

    expect(json[:about]).to include(name: about_info.name, content: about_info.content)
  end
end
