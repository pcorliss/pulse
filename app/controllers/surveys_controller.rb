class SurveysController < ApplicationController
  def show
    @survey = Survey
      .preload(questions: :answers) # This is a bit slower, but sets up the association
      .find_by_slug!(params[:survey_id])
  end
end
