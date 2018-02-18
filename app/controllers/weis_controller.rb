class WeisController < ApplicationController
  def index
  end

  def show
  end

  def create
    wei = Wei.new(wei_params)
    wei.save
  end

  def update
    wei = Wei.find(params[:id])
    wei.update(wei_params)
  end

  private

  def wei_params
    params.require(:wei).permit(:sender, :receiver, :wei)
  end
end
