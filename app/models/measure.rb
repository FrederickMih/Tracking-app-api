class Measure < ApplicationRecord
  belongs_to :measurement
  validates_presence_of :value, numericality: { only_float: true }
end
