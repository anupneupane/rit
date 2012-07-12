class User < ActiveRecord::Base
  has_many :courses, :through => :registrations
  has_many :registrations
  has_and_belongs_to_many :roles
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  # Virtual attribute for authenticating by either username or email
  # # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login
  

  ### This is the correct method you override with the code below
  #### def self.find_for_database_authentication(warden_conditions)
  #### end 
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  def role?(role)
      
      return !!self.roles.include?(role)
  end 
end

