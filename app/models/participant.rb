class Participant < ApplicationRecord
  enum gender: { not_given: 0, male: 1, female: 2 }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, phone: true
  validates :height, :zip, :current_weight, numericality: true
  validates :gender, inclusion: { in: Participant.genders.keys }

end
