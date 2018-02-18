# == Schema Information
#
# Table name: user_locations
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  address    :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
#  expired_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserLocation < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode
  after_create :delete_old_location

  private

  def delete_old_location
    UserLocation.where(user_id: user_id).where.not(id: id).delete_all
  end
end
