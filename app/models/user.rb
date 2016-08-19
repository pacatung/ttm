class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.name = auth.info.name   # assuming the user model has a name
     user.image = auth.info.image # assuming the user model has an image
     end
   end

  def self.new_with_session(params, session)
     super.tap do |user|
       if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
         user.email = data["email"] if user.email.blank?
       end
     end
   end

   has_many :posts
   has_many :photos

   has_many :user_countryships
   has_many :countries, :through=>:user_countryships

   has_many :user_locationships
   has_many :locations, :through=>:user_locationships

   has_many :favorites
   has_many :favorited_posts, :through=>:favorites, source: :post


   # add follow model:
   #   user_id
   #   follow_user_id
   #
   #class Follow < ActiveRecord::Base
   #  belongs_to :user
   #  belongs_to :following_user, :class_name => "User", :foreign_key => "following_user_id"
   #end

   # has_many :follows
   # has_many :following_users, :through=>:follows, source: :following_user

   # has_many :reverse_follows, :class_name => "Follow", :foreign_key => "following_user_id"
   # has_many :folllowed_users, :through=>:reverse_follows, source: :user



end