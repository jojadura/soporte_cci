# == Schema Information
#
# Table name: priorities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Priority < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
end
