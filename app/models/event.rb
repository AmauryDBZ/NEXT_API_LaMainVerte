class Event < ApplicationRecord
  # ASSOCIATION
  belongs_to :garden

  # VALIDATION
  validates :name, :date, :description, presence: true
end
