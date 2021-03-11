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
class GeneralInfoItem < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :content, presence: true
end
