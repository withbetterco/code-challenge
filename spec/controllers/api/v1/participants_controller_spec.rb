require 'rails_helper'

describe Api::V1::ParticipantsController, type: :controller do
  describe 'GET participants' do
    let!(:participant1) { create(:participant, status: 'accepted') }
    let!(:participant2) { create(:participant, status: 'pending') }
    let!(:participant3) { create(:participant, status: 'rejected') }

    before do
      get :index
    end

    it 'returns accepted participants in json' do
      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(1)
      expect(json_response[0]['id']).to eq(participant1.id)
    end
  end

  describe 'POST create' do
    let!(:create_params) do
      {
        email: 'steve@testingfake.net',
        f_name: 'Steven',
        l_name: 'Bansky',
        gender: 'male',
        phone: '5005553006',
        zip: 91384,
        current_weight: 163,
        height: 11
      }
    end

    context 'create success' do
      it 'creates pending participant' do
        expect do
          post :create, params: create_params
        end.to change { Participant.count }.by(1)

        participant = Participant.last
        create_params.each do |k, v|
          expect(participant.send(k)).to eq(v)
        end
        expect(participant.status).to eq('pending')

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to eq(JSON.parse(participant.to_json))
      end
    end

    context 'email already existing' do
      let!(:participant) { create(:participant, email: 'steve@testingfake.net') }

      it 'does not create participant' do
        expect do
          post :create, params: create_params
        end.to_not change { Participant.count }

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to eq({ 'error' => ['Email has already been taken'] })
      end
    end
  end

  describe 'PUT update status' do
    let(:participant) { create(:participant) }

    context 'not existing participant' do
      it 'returns not found' do
        put :update, params: { id: 123, status: 'accepted' }

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to eq({ 'error' => 'Participant not found' })
      end
    end

    context 'invalid status' do
      it 'does not update participant status' do
        put :update, params: { id: participant.id, status: 'invalid' }

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to eq({ 'error' => 'Invalid status' })
      end
    end

    context 'status is accepted/rejected' do
      before do
        participant.accepted!
      end

      it 'does not update participant status' do
        put :update, params: { id: participant.id, status: 'pending' }

        expect(participant.reload.status).to eq('accepted')
        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to eq({ 'error' => 'Participant has already been accepted' })
      end
    end

    context 'status is pending' do
      it 'updates participant status' do
        put :update, params: { id: participant.id, status: 'accepted' }

        expect(participant.reload.status).to eq('accepted')
        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to eq(JSON.parse(participant.to_json))
      end
    end
  end
end
