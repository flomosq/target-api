RSpec.describe 'PUT api/v1/users', type: :request do
  let(:user) { create(:user) }
  let(:params) { { name: 'John Doe', gender: 'male' } }

  let(:headers) { auth_headers(user) }

  subject { put user_registration_path, params: params, headers: headers, as: :json }

  context 'when the request is correct' do
    it 'returns a successful response' do
      subject

      expect(response).to be_successful
    end

    it 'updates the user' do
      subject

      expect(user.reload.gender).to eq(params[:gender])
      expect(user.name).to eq(params[:name])
    end

    it 'returns the user' do
      subject

      Approvals.verify(response.body, name: 'updated_user', format: :json)
    end

    context 'when an avatar is attached' do
      let(:avatar_filename) { 'icon.png' }
      let(:avatar) { file_body(avatar_filename) }

      before do
        params[:avatar] = avatar
      end

      it 'returns a successful response' do
        subject

        expect(response).to be_successful
      end

      it 'user has avatar attached' do
        subject

        expect(user.reload.avatar.attached?).to be true
      end

      it "increases active storage attachements' count" do
        expect {
          subject
        }.to change(ActiveStorage::Attachment, :count).by(1)
      end
    end
  end

  context 'with invalid data' do
    let(:params) { { email: 'not_an_email' } }

    it 'does not return success' do
      subject

      expect(response).to_not be_successful
    end

    it 'does not update the user' do
      subject

      updated_user = User.find(user.id)

      expect(updated_user.email).to_not eq(params[:email])
    end

    it 'returns the error' do
      subject

      expect(json[:errors][:email]).to include('is not an email')
    end
  end

  context 'when sending extra data' do
    let(:nickname) { 'not_updated_nickname' }
    let(:params) { { nickname: nickname } }

    it 'does not update those keys' do
      expect {
        subject
      }.not_to change(user.reload, :nickname)
    end
  end

  context 'when given incorrect headers' do
    let(:headers) { {} }

    it 'returns not found' do
      subject

      expect(response).to be_not_found
    end
  end
end
