# == Schema Information
#
# Table name: contacts
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  message    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :contact do
    email
    message { Faker::Lorem.paragraph }
  end
end
