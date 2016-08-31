class FavoritesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post

  def create
    @favorite = @post.find_my_favorite(current_user)

    unless @favorite
      @favorite = Favorite.create!( :post => @post, :user => current_user )
    end

    render "reload"
  end

  def destroy
    @favorite = @post.favorites.find( params[:id] )
    @favorite.destroy

    @favorite = nil

    render "reload"
  end

   protected

   def set_post
    @post = Post.find( params[:post_id ])
   end
end