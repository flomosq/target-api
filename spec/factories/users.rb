FactoryBot.define do
  sequence(:email) { |n| "test#{n}@test.com" }
  factory :user do
    email
    password { '12345678' }
    gender { 'female' }
  end
end
