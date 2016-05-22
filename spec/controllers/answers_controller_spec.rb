require 'rails_helper'

describe AnswersController do
  let(:survey) { Survey.new slug: 'test' }
  let(:valid_params) {{
    survey_id: survey.slug,
  }}

  it "redirects to the survey path" do
    survey.save
    post :create, params: valid_params
    expect(response).to redirect_to(survey_path(survey.slug))
  end

  context "expired survey" do
    it "returns 400"
  end
end
