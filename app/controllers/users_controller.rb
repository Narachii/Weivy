class UsersController < ApplicationController
  def show
    @users = User.all
    @wei = Wei.new
    @request_users = User.joins(:weis).where(weis: { receiver: current_user.id  })
  end
end
