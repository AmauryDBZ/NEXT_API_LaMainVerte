class GardenComment < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :garden
  belongs_to :user

  # VALIDATIONS
  validates :content, presence: true
end
