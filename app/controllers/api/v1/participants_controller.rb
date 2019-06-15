module Api::V1
  class ParticipantsController < ApplicationController

    def index
      render json: Participant.accepted
    end

    def create
      participant = Participant.new(participant_params)

      if participant.save
        render json: participant
      else
        render json: { error: participant.errors.full_messages }
      end
    end

    def update
      unless Participant.statuses.keys.include?(params[:status])
        render json: { error: 'Invalid status' }
        return
      end

      if participant = Participant.find_by_id(params[:id])
        if participant.pending?
          participant.status = params[:status]
          participant.save
          render json: participant
        else
          render json: { error: "Participant has already been #{participant.status}" }
        end
      else
        render json: { error: 'Participant not found' }
      end
    end

    private

    def participant_params
      params.permit(:f_name, :l_name, :phone, :email, :gender, :current_weight, :height, :zip)
    end

  end
end
