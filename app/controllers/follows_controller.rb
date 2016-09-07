class FollowsController < ApplicationController	 
	  before_action :authenticate_user!
	  before_action :set_user, :only => [:destroy, :create]
	def create
    @favorite = @user.find_my_following(current_user)

    unless @follow
      @follow = Follow.create!( :following_user => @user, :user => current_user )
    end

    if request.referrer == "http://localhost:3000/posts"
      render "reload_index_follow"
    else
      render "reload_following"
    end
  end

  def destroy
    @follow = current_user.follows.find( params[:id] )
    @follow.destroy

    @follow = nil

    if request.referrer == "http://localhost:3000/posts"
      render "reload_index_follow"
    else
      render "reload_following"
    end
  end

protected
  def set_user
    @user = User.find(params[:user_id])
  end
end