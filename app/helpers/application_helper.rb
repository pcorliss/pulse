module ApplicationHelper

  def transform_responses_d3(current_survey, responses, questions)
    out = []
    streams = {}
    response_count = {}

    questions.each do |question|
      streams[question.id] = {
        key: question.id.to_s, # need short-title
        values: []
      }

      response_count[question.id] = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0}
      response_count[question.id]
    end

    responses.each do |response|
      next if response.response.nil?
      #response_count[response.question_id][response.response] ||= 0 # only happens on invalid vals
      response_count[response.question_id][response.response] += 1
    end

    response_count.each do |question_id, response_distribution|
      response_distribution.sort_by(&:first).each do |response, count|
        streams[question_id][:values] << {
          x: response,
          y: count,
        }
      end
    end

    streams.each do |question_id, value|
      out << value
    end

    out
  end

  # Historical Input
  # {Q1 => {date => [response, response, response]}}
end
