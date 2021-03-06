require 'rails_helper'

describe Survey do
  let(:survey) { Survey.new }

  describe "#expired?" do
    it "returns false if expiration is null" do
      expect(survey.expired?).to be_falsey
    end

    it "returns true if expiration is < Now" do
      survey.expiration = Time.now - 1.minute
      expect(survey.expired?).to be_truthy
    end

    it "returns false if expiration is > Now" do
      survey.expiration = Time.now + 1.minute
      expect(survey.expired?).to be_falsey
    end
  end
end
