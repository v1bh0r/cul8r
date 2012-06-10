class User < ActiveRecord::Base

  after_create :welcome_email

  has_many :watch_list_movie_entries

  has_many :notifications, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin

  def welcome_email
    UserNotification.welcome(self).deliver
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password. 
      User.create!(:email => data.email, :password => Devise.friendly_token[0, 20])
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

  def name
    self.email
  end

  def movies_in_watch_list
    self.watch_list_movie_entries.all(:include => :movie, :order => "watch_list_movie_entries.id asc").collect { |entry| entry.movie }
  end

  def role?

  end

  def admin?
    self.admin
  end

  def recommended_movies
    Movie.all( :conditions => "critics_score > 70", :limit => 6, :order=>"release_dates desc")
  end
end
