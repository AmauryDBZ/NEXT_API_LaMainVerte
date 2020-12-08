class GardenTag < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :tag
  belongs_to :garden
end
