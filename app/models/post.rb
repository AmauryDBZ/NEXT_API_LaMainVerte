class Post < ApplicationRecord
  # ASSOCIATIONS
  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :post_likes, dependent: :destroy
  belongs_to :garden

  # VALIDATIONS
  validates :title, :content, presence: true
end
