class Country < ApplicationRecord
  # ASSOCIATIONS
  has_many :locations

  # VALIDATIONS
  validates :name, presence: true
end
