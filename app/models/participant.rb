class Participant < ApplicationRecord
  enum gender: { not_given: 0, male: 1, female: 2 }
  enum status: { pending: 0, accepted: 1, rejected: 2 }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone, phone: true, allow_blank: true
  validates :height, :zip, :current_weight, numericality: true,  allow_blank: true
  validates :gender, presence: true, allow_blank: true
  validates :gender, inclusion: { in: genders.keys }, allow_blank: true
  validates :status, inclusion: { in: statuses.keys[statuses[:accepted]..-1] }, on: :update
end
