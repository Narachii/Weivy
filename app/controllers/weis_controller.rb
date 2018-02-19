class WeisController < ApplicationController
  def index
  end

  def show
    @wei = Wei.find(params[:id])
    @receiver = User.find(@wei.receiver)
    @sender = User.find(@wei.sender)
  end

  def create
  #  wei = Wei.new(wei_params)
   # wei.save
  end

  def update
    wei = Wei.find(params[:id])
    if wei.update(wei_params)
      redirect_to wei_path(wei)
    else
      redirect_to user_path(current_user)
    end
  end

  def complete
    @wei_girl = Wei.find(params[:id]).user
  end

  private

  def wei_params
    params.require(:wei).permit(:sender, :receiver, :wei)
  end
end
