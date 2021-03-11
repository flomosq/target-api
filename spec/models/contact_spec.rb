# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  message    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Contact, type: :model do
  subject { create(:contact) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:message) }

    it { is_expected.not_to allow_value('example').for(:email) }
    it { is_expected.not_to allow_value('example.com').for(:email) }
    it { is_expected.not_to allow_value('@example.com').for(:email) }
    it { is_expected.not_to allow_value('name@example').for(:email) }
    it { is_expected.not_to allow_value('name@').for(:email) }

    it { is_expected.to allow_value('name@example.com').for(:email) }
  end
end
