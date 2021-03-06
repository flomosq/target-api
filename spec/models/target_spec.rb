# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  latitude   :decimal(10, 6)   not null
#  longitude  :decimal(10, 6)   not null
#  radius     :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_targets_on_topic_id  (topic_id)
#  index_targets_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (topic_id => topics.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Target, type: :model do
  subject { create(:target) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:radius) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it {
      is_expected.to validate_numericality_of(:latitude)
        .is_less_than_or_equal_to(90)
        .is_greater_than_or_equal_to(-90)
    }
    it {
      is_expected.to validate_numericality_of(:longitude)
        .is_less_than_or_equal_to(180)
        .is_greater_than_or_equal_to(-180)
    }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:topic) }
    it { is_expected.to belong_to(:user) }
  end

  context 'when the user has 10 targets' do
    let(:user) { create(:user) }

    before { create_list(:target, 10, user: user) }

    subject { build(:target, user: user) }

    it 'is invalid' do
      is_expected.to be_invalid
    end

    it 'adds targets per user limit error' do
      subject.valid?

      expect(subject.errors[:targets]).to include(
        I18n.t('models.target.errors.targets_per_user_limit', limit: 10)
      )
    end
  end
end
