FactoryBot.define do
  factory :user do
    email
    password { '12345678' }
    gender { 'female' }

    after(:create, &:confirm)
  end
end
