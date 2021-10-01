class Measure < ApplicationRecord
  belongs_to :measurement
  validates :value, numericality: { only_float: true }
end
