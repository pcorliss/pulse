class Question < ApplicationRecord
  has_and_belongs_to_many :surveys
  has_many :answers

  def stats(survey)
    # We filter here instead of doing a where query to leverage preloading
    @states ||= answers.select {|a| a.survey_id == survey.id }.map(&:response).compact.descriptive_statistics
  end
end
