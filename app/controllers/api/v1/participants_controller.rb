module Api::V1
  class ParticipantsController < ApplicationController

    def index
      render json: Participant.all
    end

  end
end
