class Admin < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  # :registerable, :recoverable, :rememberable, :trackable
  devise :database_authenticatable, :validatable, :timeoutable,
	 :timeout_in => 20.minutes

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation
end
