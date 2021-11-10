class Measure < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates :value, presence: true

  scope :newest_first, -> { order('created_at DESC') }
  scope :group_by_date, -> { group_by { |items| items.created_at.to_date } }
  scope :group_by_measurement, -> { group_by { |items| items.,measurement.measurement_name } }

  scope :measures, -> { measures.includes(:measurement) }
  scope :sum_value, -> { sum(:value) }
end