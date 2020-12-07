class Location < ApplicationRecord
  has_many :gardens
  belongs_to :country
end
