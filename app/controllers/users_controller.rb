class UsersController < ApplicationController
   before_action :set_user, :only=>[:show]

  def show
    @posts = @user.posts.order('id desc')
  end
  def edit
    
  end
  def update
    
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :email, :image)
  end
end
