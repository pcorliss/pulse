class Question < ApplicationRecord
  has_and_belongs_to_many :surveys
  has_many :answers

  def stats(survey)
    return @stats if @stats
    # We filter here instead of doing a where query to leverage preloading
    responses = answers.select {|a| a.survey_id == survey.id }.map(&:response).compact.extend(DescriptiveStatistics)
    @stats = responses.descriptive_statistics
  end
end
