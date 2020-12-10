class PostLike < ApplicationRecord
    # ASSOCIATIONS
    belongs_to :user
    belongs_to :post

    # VALIDATIONS 
    validates_uniqueness_of :user_id, scope: [:post_id]
end