class Tag < ApplicationRecord
  # ASSOCIATIONS
  has_many :garden_tags
  has_many :gardens, through: :garden_tags
  has_many :post_tags
  has_many :posts, through: :post_tags

  # VALIDATIONS
  validates :name, presence: true
end
