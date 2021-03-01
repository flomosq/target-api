require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it { is_expected.to define_enum_for(:gender).with_values(male: 0, female: 1, other: 2) }
    it { is_expected.to validate_presence_of(:gender) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:targets).dependent(:destroy) }
  end
end
