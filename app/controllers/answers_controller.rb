class AnswersController < ApplicationController
  def new
    @survey = Survey
      .preload(:questions)
      .find_by_slug!(params[:survey_id])
    redirect_to survey_path @survey.slug if @survey.expired?
    redirect_to survey_path @survey.slug if cookies[@survey.slug]
  end

  def create
    @survey = Survey
      .preload(:questions)
      .find_by_slug!(params[:survey_id])

    return render :plain => "Expired", :status => 400 if @survey.expired?

    @survey.questions.each do |question|
      question.answers.create(survey: @survey, response: params[question.id.to_s])
    end

    cookies[@survey.slug] = Time.now

    redirect_to survey_path @survey.slug
  end
end
