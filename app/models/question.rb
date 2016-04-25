class Question < ApplicationRecord
  has_and_belongs_to_many :surveys
  has_many :answers

  def stats(survey)
    return @stats if @stats
    # We filter here instead of doing a where query to leverage preloading
    responses = answers.select {|a| a.survey_id == survey.id }.map(&:response).compact.extend(DescriptiveStatistics)
    @stats = responses.descriptive_statistics
  end

  #def historical_stats
    #return @historical_stats if @historical_stats
    #@historical_stats = {}
    #answers.group_by(&:survey).each do |date, survey_answers|
      #survey_responses = survey_answers.map(&:response).compact.extend(DescriptiveStatistics)
      #@historical_stats[date] = survey_responses.descriptive_statistics
    #end
    #@historical_stats
  #end
end
