class UserController < ApplicationController
  before_action :authenticate_user!
def index
  @users = User.all
end

  def show
    @user = User.find(params[:id])
  end

    def follow
      current_user.following.push(params[:id])
      current_user.save!
      redirect_to user_path(id: params[:id])
    end

    def unfollow
      current_user.following.delete(params[:id])
      current_user.save!
      redirect_to user_path(id: params[:id])
    end
end
