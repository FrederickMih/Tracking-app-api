class Measurement < ApplicationRecord
  belongs_to :user
  has_many :measures, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates_presence_of :image_url
end
