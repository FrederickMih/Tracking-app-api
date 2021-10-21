require 'rails_helper'

RSpec.describe Measure, type: :model do
  measurement = Measurement.create!(name: 'Left-bicep', image_url: 'Left-bicep-photo')
  it { should belong_to(:measurement) }
  it { should validate_presence_of(:value) }
end
