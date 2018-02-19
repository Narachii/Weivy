class UsersController < ApplicationController
  before_action :set_user, only: [:show,:update,:edit]

  def new
    @user = current_user
  end

  def show
    @users = User.where.not(id: current_user.id)
    @wei = Wei.new
    @request_users = User.joins(:weis).where(weis: { receiver: current_user.id  })
  end

  def edit
    @user = current_user   
  end

  def update
    if @user.update(edit_user_params)
      #updateが完了したら一覧ページへリダイレクト
      redirect_to user_path(@user.id)
    else
      #updateを失敗すると編集ページへ
      render 'edit'
    end
  end


  private
  
  def edit_user_params
    params.require(:user).permit(:nickname)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
