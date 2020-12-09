class PostComment < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :post
  belongs_to :user

  # VALIDATIONS
  validates :content, presence: true
end
