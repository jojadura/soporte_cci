# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Role < ActiveRecord::Base
	has_many :users

	scope :usuario, -> {find_by(:name=>'Usuario')}

	validates :name, presence: true

end