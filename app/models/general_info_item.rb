# == Schema Information
#
# Table name: general_info_items
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_general_info_items_on_name  (name) UNIQUE
#
class GeneralInfoItem < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :content, presence: true
end
