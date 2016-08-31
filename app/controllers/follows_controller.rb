class FollowsController < ApplicationController	 
	  before_action :authenticate_user!
	  before_action :set_user
	def create
    @favorite = @user.find_my_following(current_user)

    unless @follow
      @follow = Follow.create!( :following_user => @user, :user => current_user )
    end

    render "reload_following"
  end

  def destroy
    @follow = current_user.follows.find( params[:id] )
    @follow.destroy

    @follow = nil

    render "reload_following"
  end

protected
  def set_user
    @user = User.find(params[:user_id])
  end
end