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
class Contact < ApplicationRecord
  validates :email, presence: true
  validates :message, presence: true
end
