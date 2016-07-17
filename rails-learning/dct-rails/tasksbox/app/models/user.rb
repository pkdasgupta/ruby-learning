class User < ActiveRecord::Base

	has_many :clients
	has_many :projects
	has_many :tasks

  after_create :setup_user_role

    has_many :permissions
    has_many :roles, through: :permissions
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role?(role)
      self.roles.pluck(:name).include? role
  end

  private

  def setup_user_role
    self.roles.push(Role.second)
  end
  
end
