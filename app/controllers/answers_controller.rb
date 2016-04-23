class AnswersController < ApplicationController
  def new
    @survey = Survey
      .preload(:questions)
      .find_by_slug!(params[:survey_id])
  end

  def create
    @survey = Survey
      .preload(:questions)
      .find_by_slug!(params[:survey_id])
    @survey.questions.each do |question|
      question.answers.create(survey: @survey, response: params[question.id.to_s])
    end

    redirect_to survey_path @survey.slug
  end
end
