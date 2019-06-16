require 'rails_helper'

describe 'patch participant`s route', type: :request do
  context 'with a valid status' do
    it 'updates participant`s status' do
      participant = Participant.create!(gender: 'male')

      patch "/v1/participants/#{participant.id}", params: {
        participant: { status: 'accepted' }
      }

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to eq ({ 'message' => 'Participant status is updated!'})
    end
  end

  context 'with aa invalid status' do
    it 'updates participant`s status' do
      participant = Participant.create!(gender: 'male')

      patch "/v1/participants/#{participant.id}", params: {
        participant: { status: 'pending'}
      }

      expect(response.status).to eq 422
      expect(JSON.parse(response.body)).to eq ({ 'errors' => { 'status' => 'is not included in the list' }})
    end
  end
end
