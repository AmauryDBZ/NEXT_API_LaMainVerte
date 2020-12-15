class Event < ApplicationRecord
  # ASSOCIATION
  belongs_to :garden

  # VALIDATION
  validates :name, :start_date, :end_date, :description, presence: true
end
