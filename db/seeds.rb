GeneralInfoItem.create!(
  name: 'about',
  content: Faker::Lorem.paragraph
)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
