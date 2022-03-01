class UsersController < ApplicationController

  def index
    # 投稿を持っているユーザーだけにしたい
    @users = User.has_post
  end

  def show
    @user = User.find(params["id"])
  end

  def edit
    @user = User.find(params["id"])
  end

  def update
    @user = User.find(params["id"])
    @user.update(user_params)
    redirect_to user_path(@user)   
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
  
end
