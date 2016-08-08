# == Schema Information
#
# Table name: directions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Direction < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
end
