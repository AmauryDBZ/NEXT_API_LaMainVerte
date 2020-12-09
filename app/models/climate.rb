class Climate < ApplicationRecord
  # ASSOCIATIONS
  has_many :gardens

  # VALIDATIONS
  validates :name, presence: true

end
