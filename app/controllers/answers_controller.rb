class AnswersController < ApplicationController
  def new
    @survey = Survey
      .preload(:questions)
      .find_by_slug!(params[:survey_id])
  end

  def create
    @survey = Survey.find_by_slug!(params[:survey_id])
  end
end
