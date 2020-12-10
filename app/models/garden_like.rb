class GardenLike < ApplicationRecord
    # ASSOCIATIONS
    belongs_to :user
    belongs_to :garden 

    # VALIDATIONS
    validates_uniqueness_of :user_id, scope: [:garden_id]
end