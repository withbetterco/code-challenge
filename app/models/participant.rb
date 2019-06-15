class Participant < ApplicationRecord
  enum status: { pending: 0, accepted: 1, rejected: 2 }
  enum gender: { not_given: 0, male: 1, female: 2 }
end
