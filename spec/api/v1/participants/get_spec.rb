require 'rails_helper'

describe 'get all questions route', type: :request do
  it 'returns status code 200' do
    get '/v1/participants'
    
    expect(response.status).to eq 200
  end
end
