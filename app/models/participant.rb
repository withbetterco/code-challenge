class Participant < ApplicationRecord
  enum gender: { not_given: 0, male: 1, female: 2 }
end
