class PostsController < ApplicationController
  before_action :find_post, :only => [ :show, :edit, :update, :destroy]

  def landing
    @posts = Post.order("id DESC").limit(15)
  end

  def index
    @posts = Post.order("id DESC").limit(15)
    @locked_posts = Post.where(status: :'locked')
    @published_posts = Post.where(status: :'published')
    @draft_posts = Post.where(status: :'draft')
    @trashcan_posts = Post.where(status: :'trashcan')

    #@favorite_user = Favorite.where(:user_id=>current_user.id)
    # @favorite_posts = Post.where(:id=>@favorite_user.post_id)

    #@favorite_posts = Post.joins(:favorites).where(:user_id=>current_user.id).where(:id=>post_id)

    @favorite_posts = current_user.favorited_posts

    # = Bag.joins(:bookings).where( "bookings.pickup_date > ? OR bookings.return_date < ?",
    # @booking.return_date, @booking.pickup_date ).where(:location=> @booking.get_bag_location, :is_rented => false).uniq
    # @favorite_posts = Post.find_by_sql("select * from posts,favorites where posts.id = favortie.post_id")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    #if @post.status == published
      @post.publish_on = Time.now
    #else
    #end

    respond_to do |format|
      if @post.save
        if params[:pics]
          #===== post pics[] here
          params[:pics].each { |pic|
            @post.photos.create(pic: pic)
          }
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      end
    end
  end

  def show
    @photos = @post.photos
  end

private
  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit( :title, :start_date,:return_date, :origin, :destination, :distance, :description,:user_id,
     :status, :publish_on, photos_attributes: [:post_id, :photo_location, :pic],countries_attributes:[:country,:_destroy,:id],
      locations_attributes:[:location,:_destroy,:id])
  end
end
