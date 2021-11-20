require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    post '/registrations', params: { user: { username: 'fred', password: '123456', password_confirmation: '123456' } }
  end
  describe 'POST /registrations' do
    it 'creates a new user' do
      user = User.last
      expect(user.username).to eql('fred')
    end

    it 'sets the status of created' do
      expect(json['status']).to eql(200)
    end
  end
end