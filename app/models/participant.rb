class Participant < ApplicationRecord
  enum gender: { not_given: 0, male: 1, female: 2 }
  enum status: { pending: 0, accepted: 1, rejected: 2 }
  
  
  def check_status(st)
    # To allow the case senstive values for status value
    if ["accepted", "rejected"].include?(st.strip.downcase)
      self.status = st.strip.downcase
    else
      errors.add(:status, "should be accepted or rejected")
    end
  end
end
