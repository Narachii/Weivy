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

class Wei < ApplicationRecord
#  after_create_commit { WeiBroadcastJob.perform_later self }
  belongs_to :user, foreign_key: "sender", class_name: "User"
end
