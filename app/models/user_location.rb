# == Schema Information
#
# Table name: user_locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float(24)
#  longitude  :float(24)
#  expired_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserLocation < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
end
