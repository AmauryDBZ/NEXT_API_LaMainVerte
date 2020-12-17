class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  # ASSOCIATIONS
  has_many :gardens, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :garden_comments, dependent: :destroy
  has_many :testimonies, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :garden_likes, dependent: :destroy

  # VALIDATIONS
  validates :email, :first_name, :last_name, :username,
    presence: true

  validates_uniqueness_of :email, :username
  validate :check_email_and_password
  validate :check_password_confirmation, on: :create

  def check_email_and_password
    errors.add(:password, ": can't be the same as email") if email == password
  end

  def check_password_confirmation
    errors.add(:password_confirmation, ": passwords do not match") if password_confirmation != password
  end

  def self.filter(params)
    if (params.keys.length() > 2)
      like_params = ["first_name", "last_name", "email", "username"]
      query_parts = []
      params.each do |k, v|
        if (k != "action" && k != "controller")
          if (like_params.include?(k))
            query_parts.push("#{k} LIKE '%#{v}%'")
          end
        end
      end
      query_string = query_parts.join(" AND ")
      return User.where(query_string)
    else
      return User.all(query_string)
    end
  end
end
