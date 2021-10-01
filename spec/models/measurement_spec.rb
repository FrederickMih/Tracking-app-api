require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it { should have_many(:measures).dependent(:destroy)
end
