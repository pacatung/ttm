class UsersController < ApplicationController
   before_action :set_user, :only=>[:show,:edit, :update]

  def show
    @posts = @user.posts.order('id desc')
    @post_countrys = PostCountryship.joins(:post)
    @country_ids = @post_countrys.collect(&:country_id)
    @countrys = []
    @country_ids.each do |ci|
      @countrys.push(Country.find(ci))
    end 
    @country_names = @countrys.collect(&:name).uniq
# bad example
    # @post_countrys = []
    # @posts.map do |post|
    #   if post.post_countryships != []
        # @post_countrys.push(post.post_countryships)
    #     @post_countrys.push(PostCountryship.where(:post_id=>post.id))
    #   end
    # end
    # below fail
    # @country_ids =[]
    # @country_ids = @post_countrys.collect(&:country_id)
    # @post_countrys.map do |c|
      # @country_ids.push(c.country_id)
    # end
  end

  def edit
  end
  def update
    @user.update(user_params)

    redirect_to user_path(@user)
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :email, :image, :name, :about_user)
  end
end
