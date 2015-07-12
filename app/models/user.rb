class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #
  # allow users to sign in with either their username or email
  #
  attr_accessor :login
  
  def self.find_for_database_authentication(warden_conditions)
  	conditions = warden_conditions.dup
    
    if login = conditions.delete(:login)
    	where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	else
		where(conditions.to_hash).first
	end
  end

  validates :username,
	:presence => true,
	:uniqueness => {
		:case_sensitive => false
  	},
	
	:length => {
		:minimum => 4,
		:maximum => 16,
		:too_short => "is too short (minimum is %{count} characters)",
		:too_long => "is too long (maximum is %{count} characters)"
	}

end
