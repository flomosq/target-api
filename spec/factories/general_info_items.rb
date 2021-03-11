# == Schema Information
#
# Table name: general_info_items
#
#  id         :bigint           not null, primary key
#  content    :text
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :general_info_item do
    name { Faker::Lorem.unique.word }
    content { Faker::Lorem.paragraph }
  end
end
