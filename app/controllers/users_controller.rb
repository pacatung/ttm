class UsersController < ApplicationController
   before_action :find_user, :only=>[:show]

  def show
    @user = current_user
  end

private
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit( :email, :image)
  end

end
