class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


=begin
DEVISE 
 Normal active subclass but it has this calls to devise which allows you to 
 choose which modules you want to use to customize authentication 
 experience. http://github.com/plataformatec/devise - These modules map
 to the readme documentation. If you remove one of the modules make sure to remove them
 from migration file.
=end
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#attr_accessible :first_name, :last_name, :email, :password
	
	attr_accessor :password_confirmation


	before_save { self.email = email.downcase }
	validates :first_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_many :events
  accepts_nested_attributes_for :events
  has_many :microposts, dependent: :destroy
  #Chapter 11 - User Follower
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
has_many :passive_relationships, class_name:  "Relationship",
 foreign_key: "followed_id",
dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
#Fun with condition - Episode 15 and Episode 37 - Simple Search
#http://stackoverflow.com/questions/25777318/couldnt-find-listing-with-id-all-search-form
def self.search(search)
  if search
p search
    User.where("first_name like ?", "%#{search}%")
  else
    User.all 
    #- railscast 240 return a array of records which will perform the query
    # instead want to return a
    #  scope to add more calls to it later on ..so it doesn't perform the acutal query
    #scoped
  end
end

# Follows a user - Chapter 11
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end

=begin
	def self.search(search)
		if search
			find(:all, :conditions => ["first_name LIKE ? OR last_name LIKE ?", "%#{search}%", "%#{search}%"]) 
 		else
			flash[:notice] = "No User Found"
			redirect_to root_pat
		end
	end
end

=end
