class UsersController < ApplicationController

  def new
    # TODO Facebookから返ってきた後のロジック入れる
    render layout: "statics_application"
  end

  def show
    @users = User.where.not(id: current_user.id)
    @wei = Wei.new
    @request_users = User.joins(:weis).where(weis: { receiver: current_user.id  })
  end

  def edit
    @user = current_user
  end

  def weier
    current_user.get_wei_target(params[:dist])
  end
end
