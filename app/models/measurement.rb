class Measurement < ApplicationRecord
    has_many :measures

    validates_presence_of :name, length: { minimum: 3, maximum: 24 }
    validates_presence_of :image_url
end
