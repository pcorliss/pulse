class Survey < ApplicationRecord
  has_and_belongs_to_many :questions
  has_many :answers

  def expired?
    expiration && expiration < Time.now
  end
end
