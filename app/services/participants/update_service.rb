class Participants::UpdateService
  def success?
    @success
  end

  def call(params)
    @success = true
    return if update_participant(params)

    @success = false
    nil
  end

  def errors_json
    { errors: @errors }.to_json
  end

  def success_json
    { message: 'Participant status is updated!' }.to_json
  end

  private

  def update_participant(params)
    participant = Participant.find_by(params[:id])
    participant.status = params.fetch(:status)

    return true if participant.save

    @errors = serialized_errors(participant.errors.messages)
    false
  end

  def serialized_errors(messages)
    { status: messages.fetch(:status).first }
  end
end
