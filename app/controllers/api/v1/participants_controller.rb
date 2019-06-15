module Api::V1
  class ParticipantsController < ApplicationController
    before_action :find_participant, only: [:update]
    

    def index
      render json: Participant.where(status: "accepted")
    end

    # create new participant
    def create
      # ignore the status parameter as by default value has to be set as pending
      @participant = Participant.new(permitted_params)

      if @participant.save
        render status: 200, json: {participant: @participant}
      else
        render status: 400, json: {message: @participant.errors.messages}.to_json
      end
    end

    # update the existing participant
    def update
      # To permit only accepted or rejected as status values
      @participant.check_status(params[:participant][:status]) if params[:participant][:status].present?
      
      if @participant.errors.blank? && @participant.update(permitted_params)
        render status: 200, json: {participant: @participant}
      else
        render status: 400, json: {message: @participant.errors.messages}.to_json
      end
    end

    private
    

    def permitted_params
      params.require(:participant).permit(:email, :f_name, :l_name, :gender, :phone, :zip, :current_weight, :height)
    end

    def find_participant
    	@participant = Participant.find_by(id: params[:id])
      render status: 404, json: {message: "Participant Not Found!"}.to_json if !@participant
    end

  end
end
