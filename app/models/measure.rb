class Measure < ApplicationRecord
  belongs_to :user
  belongs_to :measurement

  validates :data, presence: true

  scope :newest_first, -> { order('created_at DESC') }
  scope :group_by_date, -> { group_by { |items| items.created_at.to_date } }
  scope :group_by_product, -> { group_by { |items| items.measurement.measurement_name } }

  scope :measures, -> { deals.includes(:measurement) }
  scope :sum_data, -> { sum(:data) }
end
