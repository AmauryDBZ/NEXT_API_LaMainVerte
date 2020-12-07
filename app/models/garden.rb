class Garden < ApplicationRecord
  has_many :garden_tags
  has_many :tags, through: :garden_tags
  has_many :garden_comments
  has_many :posts
  belongs_to :garden_type
  belongs_to :climate
  belongs_to :location
  has_many :follows               
  belongs_to :user
  has_many :events 
end 
