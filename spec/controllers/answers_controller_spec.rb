require 'rails_helper'

describe AnswersController do
  let(:survey) { Survey.new slug: 'test' }
  let(:valid_params) {{
    survey_id: survey.slug,
  }}

  describe "#new" do
    context "expired survey" do
      it "redirects to the survey show path" do
        survey.expiration = 1.minute.ago
        survey.save
        get :new, params: valid_params
        expect(response).to redirect_to(survey_path(survey.slug))
      end
    end
  end

  describe "#create" do
    it "redirects to the survey path" do
      survey.save
      post :create, params: valid_params
      expect(response).to redirect_to(survey_path(survey.slug))
    end

    context "expired survey" do
      it "returns 400" do
        survey.expiration = 1.minute.ago
        survey.save
        post :create, params: valid_params
        expect(response.status).to eq(400)
      end
    end
  end
end
