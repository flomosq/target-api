GeneralInfoItem.create_with(
  content: Faker::Lorem.paragraph
).find_or_create_by!(
  name: 'about'
)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
