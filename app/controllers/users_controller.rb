class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # 投稿を持っているユーザーだけにしたい
    @users = User.has_post
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path(@user), alert: "他人のアカウントです"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '更新しました'
    else
      render :edit
    end  
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end

end
