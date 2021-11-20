require 'rails_helper'

RSpec.describe 'Measurement', type: :request do
  let!(:measurements) { create_list(:measurement, 10) }
  let(:measurement_id) { measurements.first.id }

  before do
    post '/registrations', params: { user: { username: 'fred1', password: '123456', password_confirmation: '123456' } }
  end

  describe 'GET /measurements' do
    before { get '/measurements' }

    it 'returns response with measurements and status' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns measurements' do
      expect(json['measurements']).not_to be_empty
      expect(json['measurements'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /measurements/:id' do
    before { get "/measurements/#{measurement_id}" }

    it 'returns the specific measurement' do
      expect(json['measurement']).not_to be_empty
      expect(json['measurement']['id']).to eq(measurement_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
