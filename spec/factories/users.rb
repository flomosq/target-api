FactoryBot.define do
  factory :user do
    email { 'test@test.com' }
    password { '12345678' }
    gender { 'female' }
  end
end
