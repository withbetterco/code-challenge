module Api::V1
  class ParticipantsController < ApplicationController

    def index
      render json: Participant.where(status: 'accepted')
    end

    def create
      participant = Participant.create(email: params[:email],
                           f_name: params[:f_name],
                           l_name: params[:l_name],
                           gender: params[:gender],
                           phone: params[:phone],
                           zip: params[:zip],
                           current_weight: params[:current_weight],
                           height: params[:height])
      render json: participant
    end

  def update
      begin 
        @participant = Participant.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        return render json: { status: "error",
                                code: 404,
                                message: "participant with id: #{params[:id]} not found" },
                                status: 404
      end

      begin
        @participant.update(status: params[:status])
        render json: @participant
      rescue ArgumentError
        render json: { status: "error",
                              code: 400,
                              message: "participant could not be updated" },
                              status: 400
      end
    end
  end
end
