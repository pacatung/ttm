class PostsController < ApplicationController
  before_action :authenticate_user! => [:index]
  before_action :find_post, :only => [ :show, :edit, :update, :destroy, :change_status]
  def landing
    @posts = Post.where(status: :'published').order("id DESC").limit(15)
  end

  def index
    @all_posts = current_user.posts.order("id DESC").limit(15)
    @locked_posts = current_user.posts.where(status: :'locked').limit(15).order('id desc')
    @published_posts = current_user.posts.where(status: :'published').limit(15).order('id desc')
    @draft_posts = current_user.posts.where(status: :'draft').limit(15).order('id desc')
    @trashcan_posts = current_user.posts.where(status: :'trashcan').limit(15).order('id desc')
    @my_following = current_user.follows(params[:id])
    @my_following_users_ids = []
    @my_following.each do |my_following|
      @my_following_users_ids.push(my_following.following_user_id)
    end
    @following_users_last_posts=[]
    @my_following_users_ids.each do |user|
      @following_users_last_posts.push(User.find(user).posts.last)
    end
    @my_following_users = []
    @my_following_users_ids.each do |user_id|
      @my_following_users.push(User.find(user_id))
    end
    @favorite_posts = current_user.favorited_posts.order("id DESC").limit(15)
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
    @photos = @post.photos[1..-1]
  end

  def edit
    
  end

  def update
    @post.update_attributes(post_params)

    respond_to do |format|
      format.html { redirect_to post_url(@post) }
    end
  end

  def change_status
    @post.update_attributes(:status => params[:status])

    respond_to do |format|
      format.html { redirect_to post_url(@post) }
      
      case @post.status
        when 'locked'
          format.js {render "change_status_locked"}
        when 'published'
          format.js {render "change_status_published"}
        when 'trashcan'
          format.js {render "change_status_to_trashcan"}
        when 'draft'
          format.js {render "change_status_draft"}
      end
    end
  end
  
private
  def find_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit( :title, :start_date,:return_date, :origin, :destination, :distance, :description,:user_id,
     :status, :publish_on, :countries, photos_attributes: [:post_id, :photo_location, :pic],countries_attributes:[:name,:_destroy,:id,:priority],
      locations_attributes:[:location,:_destroy,:id,:priority])
  end
end