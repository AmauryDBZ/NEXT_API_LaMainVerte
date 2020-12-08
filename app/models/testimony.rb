class Testimony < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :user

  # VALIDATIONS
  validates :content, presence: true
end
