require 'rails_helper'

describe 'post new participants route', type: :request do
  context 'with a valid participant' do
    it 'returns status code 200 and inserts participant to DB' do
      post '/v1/participants', params: {
        participant: {
          firstName: 'Yan',
          lastName: 'Matveichuk',
          phoneNumber: '+38(093)264-38-93',
          email: 'yan.summer23@gmail.com',
          gender: 'male',
          currentWeight: '176',
          height: '510',
          zipCode: '35320'
        }
      }

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to eq ({ 'message' => 'Participant is created!'})
      expect(Participant.count).to eq 1
      expect(Participant.last).to have_attributes(
        f_name: 'Yan',
        l_name: 'Matveichuk',
        phone: '+38(093)264-38-93',
        email: 'yan.summer23@gmail.com',
        gender: 'male',
        current_weight: 176,
        height: 510,
        zip: 35320
      )
    end
  end

  context 'with invalid participant' do
    it 'returns status code 422 add errors' do
      post '/v1/participants', params: {
        participant: {
          firstName: 'Yan',
          lastName: 'Matveichuk',
          phoneNumber: 'not_a_phone',
          email: 'not_an_email',
          gender: 'male',
          currentWeight: '176',
          height: '510',
          zipCode: 'not_a_number'
        }
      }

      expect(response.status).to eq 422
      expect(JSON.parse(response.body)).to eq ({
        'errors' => {
        'email' => 'is invalid',
        'phoneNumber' => 'is invalid',
        'zipCode' => 'is not a number'
        }
      })
    end
  end
end
