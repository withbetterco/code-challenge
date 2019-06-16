module Api::V1
  class ParticipantsController < ApplicationController
    def index
      render json: Participant.all
    end

    def create
      create_service.call(participants_params)

      if create_service.success?
        render json: create_service.success_json
      else
        render json: create_service.errors_json
      end
    end

    private

    def create_service
      @_create_service ||= Participants::CreateService.new
    end

    def participants_params
      params.require(:participant).permit(
        :firstName, :lastName, :phoneNumber, :email, :gender, :currentWeight, :height, :zipCode
      )
    end
  end
end
