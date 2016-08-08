# == Schema Information
#
# Table name: supports
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :text
#  sub_categories_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  priority_id       :integer
#  user_id           :integer
#  screen            :string
#  state_id          :integer
#  poll              :integer
#  date_pending      :datetime
#  date_preclose     :datetime
#  date_close        :datetime
#

class Support < ActiveRecord::Base
#  belongs_to :subCategory
  belongs_to :subCategory, :class_name=> "SubCategory",
                          :foreign_key=> "sub_categories_id"

  enum poll: [:si,:no]

  belongs_to :user
  belongs_to :state
  belongs_to :priority
  has_many :comments
  validates :title, :sub_categories_id, :priority_id, presence: true
  mount_uploader :screen, ScreenUploader

  after_initialize :set_default_state, :if => :new_record?

  def set_default_state
    self.state_id ||= State.abierto.id
  end

=begin
  def close
   self.state_id = State.cerrado.id 
   self.save
  end
=end
  
  def close poll=nil
      update_attribute("state_id",State.cerrado.id)
      update_attribute("poll", poll) unless poll ==nil
      update_attribute("date_close", DateTime.now)
  end 

  def pre_close
    update_attribute("state_id",State.pre_finalizado.id)
    update_attribute("date_preclose",DateTime.now)
  end

  def pending
    update_attribute("state_id",State.pendiente.id)
    update_attribute("date_pending",DateTime.now)
  end

  def category_id
    return self.subCategory.category.id unless self.subCategory.nil?
  end  

  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
    else
      all
    end
  end

  scope :all_order, ->(search,page,pagination){joins(:state).search(search).order("states.order, created_at").page(page).per(pagination)}

end
