require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it { should have_many(:measures) }
  it { should validate_presence_of(:name) }
end
