class Measurement < ApplicationRecord
  has_many :measures

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates_presence_of :image_url
end
