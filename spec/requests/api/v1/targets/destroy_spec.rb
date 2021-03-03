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

  context 'when the target does not exist' do
    let!(:non_existent_id) { target.id + 1 }

    subject { delete api_v1_target_path(non_existent_id), headers: headers }

    it 'returns a not found response' do
      subject

      expect(response).to be_not_found
    end

    it 'returns the not found error message' do
      subject

      expect(json).to include(error: I18n.t('api.errors.not_found'))
    end
  end

  context 'when the target does not belong to the logged user' do
    let(:other_user) { create(:user) }
    let!(:target) { create(:target, user: other_user) }

    it 'returns a not found response' do
      subject

      expect(response).to be_not_found
    end

    it 'returns the not found error message' do
      subject

      expect(json).to include(error: I18n.t('api.errors.not_found'))
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
