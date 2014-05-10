# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  text       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  validates :text, presence: true

  has_many :secret_taggings
  has_many :secrets, through: :secret_taggings

end
