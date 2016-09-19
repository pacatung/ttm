class FavoritesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post

  def create
    @favorite = @post.find_my_favorite(current_user)

    unless @favorite
      @favorite = Favorite.create!( :post => @post, :user => current_user )
    end

    # if request.referrer == "http://localhost:3000/posts"
    #   render "reload_index_favorite"
    # else
      render "reload"
    # end
  end

  def destroy
    @favorite = @post.favorites.find( params[:id] )
    @favorite.destroy

    @favorite = nil
    # if request.referrer == "http://localhost:3000/posts"
    #   render "reload_index_favorite"
    # else
      render "reload"
    # end
  end

   protected

   def set_post
    @post = Post.find( params[:post_id ])
   end
end