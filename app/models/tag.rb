class Tag < ApplicationRecord
  has_many :garden_tags
  has_many :post_tags
end
