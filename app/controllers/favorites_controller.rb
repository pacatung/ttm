class FavoritesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post

  def create
    Favorite.create!( :post => @post, :user => current_user )

    redirect_to :back
  end

  def destroy
    favorite = @post.favorites.find( params[:id] )
    favorite.destroy

    redirect_to :back
  end

   protected

   def set_post
    @post = Post.find( params[:post_id ])
   end
end
