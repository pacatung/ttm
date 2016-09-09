class UsersController < ApplicationController
   before_action :set_user, :only=>[:show,:edit, :update]

  def show
    @posts = @user.posts.order('id desc')
  end
  def edit
    
  end
  def update
    @user.update(user_params)

    redirect_to :action => :show, :id => @user
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :email, :image, :name, :about_user)
  end
end
