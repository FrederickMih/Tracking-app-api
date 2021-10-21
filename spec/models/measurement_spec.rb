require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it { should have_many(:measures) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:image_url) }

   it 'has has an image' do
    measurement = Measurement.new(name: 'name', image_url: '')
    expect(measurement).to_not be_valid

    measurement.image_url = 'Left-bicep-photo'
    expect(measurement).to be_valid
  end

  it 'has a name between 3 and 30 characters' do
    measurement = Measurement.new(name: 'na', image_url: 'Left-bicep-photo')
    expect(measurement).to_not be_valid

    measurement.name = 'Left-bicep'
    expect(measurement).to be_valid
  end
end
