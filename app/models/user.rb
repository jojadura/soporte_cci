# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role_id                :integer
#  name                   :string
#  direction_id           :integer
#  avatar                 :string
#

class User < ActiveRecord::Base

  after_initialize :set_default_role, :if => :new_record?
  mount_uploader :avatar, AvatarUploader

  validates :name, :direction_id, presence: true
  #devise :timeoutable, :timeout_in => 1.minutes
  #devise :authenticatable, :timeoutable, :validatable, :timeout_in => 2.minutes
  
  def set_default_role
    self.role_id ||= Role.usuario.id
  end

  def admin?
    role.name=="Administrador"? true:false
  end

  def usuario?
    role.name=="Usuario"? true:false
  end
  
  def director?
  	role.name=="Director"? true:false
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories
  has_many :sub_categories
  has_many :states
  has_many :priorities
  has_many :directions
  belongs_to :role
  has_many :supports
end


