class SurveysController < ApplicationController
  def show
    @survey = Survey
      .preload(:questions, :answers)
      .find_by_slug!(params[:survey_id])
  end
end
