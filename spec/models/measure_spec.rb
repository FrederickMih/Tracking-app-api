require 'rails_helper'

RSpec.describe Measure, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:Measurement) }

  it { should validate_presence_of(:data) }
end