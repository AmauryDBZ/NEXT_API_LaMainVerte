class Follow < ApplicationRecord
  # ASSOCIATIONs
  belongs_to :garden
  belongs_to :user

  # VALIDATIONS 
  validates_uniqueness_of :user_id, scope: [:garden_id]

end
