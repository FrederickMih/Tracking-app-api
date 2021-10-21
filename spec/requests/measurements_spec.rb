require 'rails_helper'

RSpec.describe 'Measurements', type: :request do
  describe 'GET /measurements' do
    it 'should return all measurements' do
      get '/measurements'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).count).to eq(Measurement.all.count)
    end
  end

end