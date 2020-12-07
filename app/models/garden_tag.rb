class GardenTag < ApplicationRecord
  belongs_to :tag
  belongs_to :garden
end
