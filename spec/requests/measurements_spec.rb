require 'rails_helper'

RSpec.describe 'Measurements', type: :request do
  describe 'GET /measurements' do
    it 'should return all measurements' do
      get '/measurements'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).count).to eq(Measurement.all.count)
    end
  end

   describe 'GET /measurements/:id' do
    measurement = Measurement.last
    it 'should return single measurement data' do
      get "/measurements/#{measurement.id}"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include('name' => 'Left-bicep', 'image_url' => 'Left-bicep-photo',
                                                   'measures' => [])
    end
  end

end