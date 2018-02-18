class WeisController < ApplicationController
  def index
  end

  def show
  end

  def create
    @wei = Wei.new(wei_params)
    @wei.save
  end

  private

  def wei_params
    params.require(:wei).permit(:sender, :receiver)
  end
end
