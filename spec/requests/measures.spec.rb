require 'rails_helper'

RSpec.describe 'Measure', type: :request do
  before do
    post '/registrations', params: { user: { username: 'fred1', password: '123456', password_confirmation: '123456' } }
  end

  let(:user) { User.find_by(username: 'fred1') }

  before do
    measurement = create(:measurement)
    create_list(:measure, 10, user: user, measurement: measurement)
  end

  describe 'GET /measures' do
    it 'returns the measures belongs to current user' do
      get '/measures'
      expect(json.size).to eql(3)
    end

    it 'returns status 401 if user is not logged in' do
      delete '/sessions'
      get '/measures'
      expect(json['status']).to eql(401)
    end
  end
end
