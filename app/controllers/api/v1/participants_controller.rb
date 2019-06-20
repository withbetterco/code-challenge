module Api::V1
  class ParticipantsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

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
      return invalid_status unless status_param_valid?

      if participant = Participant.find(params[:id])
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

    def invalid_status
      render json: { message: "Invalid status" }
    end

    def status_param_valid?
      Participant.statuses.keys.include?(params[:status])
    end

    def not_found
      render json: { message: "Not Found" }, status: 404
    end
  end
end
