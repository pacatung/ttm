class UsersController < ApplicationController
   before_action :set_user, :only=>[:show]

  def show
    # @user = User.find( params[:id] )
    @posts = @user.posts
  end

  def trashcan
    # @trash_posts = Post.where(:user_id=>current_user.id and :status=>'trashcan')
    @trash_posts = Post.where(:user_id=>current_user.id)

  end

private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit( :email, :image)
  end

end
