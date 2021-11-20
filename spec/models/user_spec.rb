require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:measures).dependent(:destroy) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:password_confirmation) } 
  it {should validate_length_of(:username).is_at_least(4).is_at_most(8) }
 
end
