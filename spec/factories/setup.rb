FactoryBot.define do
  sequence(:email) { |n| "test#{n}@test.com" }
end
