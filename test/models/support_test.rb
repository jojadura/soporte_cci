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

require 'test_helper'

class SupportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
