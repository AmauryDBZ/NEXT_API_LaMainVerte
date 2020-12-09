class Post < ApplicationRecord
  # ASSOCIATIONS
  has_many :post_comments
  has_many :post_tags
  has_many :tags, through: :post_tags
  belongs_to :garden

  # VALIDATIONS
  validates :title, :content, presence: true
end
