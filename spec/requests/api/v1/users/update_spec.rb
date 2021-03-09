RSpec.describe 'PUT api/v1/users', type: :request do
  let(:user) { create(:user) }
  let!(:params) { attributes_for(:user, :with_name, :male).extract!(:name, :gender) }

  let!(:headers) { auth_headers }

  subject { put user_registration_path, params: params, headers: headers }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end

    it 'updates the user' do
      subject

      updated_user = User.find(user.id)

      expect(updated_user.gender).to eq(params[:gender])
      expect(updated_user.name).to eq(params[:name])
    end
  end
end
