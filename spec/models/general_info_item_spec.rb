# == Schema Information
#
# Table name: general_info_items
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_general_info_items_on_name  (name) UNIQUE
#

RSpec.describe GeneralInfoItem, type: :model do
  subject { create(:general_info_item) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_presence_of(:content) }
  end
end
