class SurveysController < ApplicationController
  def show
    @survey = Survey
      .includes(:questions => :answers)
      .find_by_slug!(params[:id])

    @survey.questions.each { |q| q.stats(@survey) }
  end
end
