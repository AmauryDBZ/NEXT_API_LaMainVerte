class Location < ApplicationRecord
  # ASSOCIATIONS
  has_many :gardens
  belongs_to :country

  # VALIDATIONS
  validates :name, presence: true
end
