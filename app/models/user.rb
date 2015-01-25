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
 

#Fun with condition - Episode 15 and Episode 37 - Simple Search
#http://stackoverflow.com/questions/25777318/couldnt-find-listing-with-id-all-search-form
def self.search(search)
  if search
    self.where("first_name like ?", "%#{search}%")
  else
    self.all
  end
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
