class Participants::CreateService
  KEYS_MAPPINGS = {
    f_name: :firstName,
    l_name: :lastName,
    phone: :phoneNumber,
    zip: :zipCode
  }.freeze

  def success?
    @success
  end

  def call(params)
    @success = true
    return if create_participant(params)

    @success = false
    nil
  end

  def errors_json
    { errors: @errors }.to_json
  end

  def success_json
    { message: 'Participant is created!' }.to_json
  end

  private

  def create_participant(params)
    participant = Participant.new(serialized_params(params))

    return true if participant.save

    @errors = serialized_errors(participant.errors.messages)
    false
  end

  def serialized_errors(messages)
    messages.map do |key, value|
      mapped_key = KEYS_MAPPINGS[key]
      [mapped_key.present? ? mapped_key : key.to_s.underscore, value.first]
    end.to_h
  end

  def serialized_params(params)
    params.to_hash.deep_transform_keys do |key|
      mapped_key = KEYS_MAPPINGS.find { |_, value| value == key.to_sym }
      mapped_key.present? ? mapped_key.first : key.underscore
    end
  end
end
