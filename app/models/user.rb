class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :firstname, :lastname, :birthday, :role_id

  validates_uniqueness_of :username

  belongs_to :team
  has_many :tipps
  has_and_belongs_to_many :roles
  has_many :user_messages
  has_many :messages, through: :user_messages
  def role?(role)
    self.roles.exists?(:name => role.to_s)
  end
end
    
