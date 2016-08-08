# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  color      :string
#  order      :integer
#

class State < ActiveRecord::Base
	belongs_to :user
	has_many :supports

	validates :order, :name, :color, presence: true

	scope :abierto, ->{find_by(:name=> Rails.application.secrets.abierto )}
	scope :cerrado, ->{find_by(:name=> Rails.application.secrets.cerrado )}
	scope :pre_finalizado, ->{find_by(:name=> Rails.application.secrets.pre_finalizado )}
	scope :pendiente, ->{find_by(:name=> Rails.application.secrets.pendiente )}

end

