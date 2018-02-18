class UserLocationsController < ApplicationController
  protect_from_forgery except: :create

  def create
    current_user.create_location(
      latitude: params["latitude"],
      longitude: params["longitude"],
      expired_at: Time.now + 30.minutes
    )
  end
end
