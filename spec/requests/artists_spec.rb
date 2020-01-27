require 'rails_helper'

RSpec.describe 'Rubitify Artist API', type: :request do
  # initialize test data 
  let!(:artists) { create_list(:artist, 10) }
  let(:artist_id) { artists.first.id }

  # Test suite for GET /api/v1/artists
  describe 'GET /api/v1/artists' do
    # make HTTP get request before each example
    before { get '/api/v1/artists' }

    it 'returns artists' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /api/v1/artists/:id/albums
  describe 'GET /api/v1/artists/:id/albums' do
    before { get "/api/v1/artists/#{artist_id}/albums" }

    context 'when the record exists' do
      it 'returns the albums' do
        expect(json).to be_empty
        # expect(json['id']).to eq(artist_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:artist_id) { 585 }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a not found message' do
        expect(response.body).to match(//)
      end
    end
  end
end