# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Questions From https://www.tinypulse.com/blog/sk-employee-engagement-survey-questions

Question.destroy_all
Survey.destroy_all
Answer.destroy_all

questions_hash = {
  "Happy" => "I'm happy when I'm at work.",
  "Refer" => "I would refer someone to work here.",
  "Understanding" => "I have a clear understanding of my career.",
  "Work Life Balance" => "I'm happy with my work-life balance.",
  "Valued" => "I feel valued at work.",
  "Recognition" => "I receive recognition from my manager often.",
  "Forsee" => "I foresee myself working here one year from now.",
  "Feedback" => "I believe the leadership team takes my feedback seriously.",
  "Transparent" => "I feel like the management team here is transparent.",
  "Core Values" => "I can recite my organization's core values.",
  "Upwards" => "I feel comfortable giving upwards feedback to my supervisor.",
  "Fun" => "I have fun at work.",
}
#Hypothetically, if you were to quit tomorrow, what would your reason be?
#What three words would you use to describe our culture?

questions = questions_hash.map do |short, question_text|
  Question.create(
    title: question_text,
    short_title: short,
  )
end

pulse1 = Survey.create(
  slug: 'pulse_two_weeks_ago',
  created_at: 2.weeks.ago,
  expiration: 1.weeks.ago,
)
pulse2 = Survey.create(
  slug: 'pulse_one_weeks_ago',
  created_at: 1.weeks.ago,
  expiration: Time.now,
)
pulse3 = Survey.create(
  slug: 'pulse_current',
  created_at: Time.now,
  expiration: 1.week.from_now,
)

pulse_surveys = [pulse1, pulse2, pulse3]

pulse_questions = questions.shuffle.first(5)
pulse_surveys.each do |survey|
  survey.questions = pulse_questions
  pulse_questions.each do |question|
    10.times do |i|
      Answer.create(
        response: rand(5) + 1,
        survey_id: survey.id,
        question_id: question.id
      )
    end
  end
end
