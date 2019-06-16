require 'rails_helper'

describe 'get all participants route', type: :request do
  it 'returns status code 200 and accepted participants' do
    pending_participants = [Participant.create!(gender: 'male'), Participant.create!(gender: 'male')]
    accepted_participants = [Participant.create!(gender: 'male'), Participant.create!(gender: 'male')]
    accepted_participants.each(&:accepted!)

    get '/v1/participants'

    response_participants_ids = JSON.parse(response.body).map { |participant| participant.fetch('id') }

    expect(response.status).to eq 200
    expect(response_participants_ids).to match_array(accepted_participants.map(&:id))
  end
end
