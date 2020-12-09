class PostTag < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :post
  belongs_to :tag
end
