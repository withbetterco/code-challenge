class Participant < ApplicationRecord
  enum gender: { not_given: 0, male: 1, female: 2 }
  enum status: { pending: 0, accepted: 1, rejected: 2 }
  validates :email, uniqueness: { case_sensitive: false }, presence: false
end
