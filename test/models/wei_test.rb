# == Schema Information
#
# Table name: weis
#
#  id         :integer          not null, primary key
#  receiver   :integer
#  sender     :integer
#  wei        :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class WeiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
