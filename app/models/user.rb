class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
		:jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # ASSOCIATIONS
  has_many :gardens
  has_many :follows
  has_many :post_comments
  has_many :garden_comments
  has_many :testimonies
  
  # VALIDATIONS
  validates :email, :first_name, :last_name,
    presence: true

  validates_uniqueness_of :email
  validate :check_email_and_password
  validate :check_password_confirmation

  def check_email_and_password
    errors.add(:password, ": can't be the same as email") if email == password
  end
    
  def check_password_confirmation
    errors.add(:password_confirmation, ": passwords do not match") if password_confirmation != password
  end

end
