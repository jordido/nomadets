FactoryGirl.define do
  factory :review do
    author_id  { Faker::Number.digit }
		reviewed_id { Faker::Number.digit }
		comment { Faker::Lorem.sentence }
		rating 1
		course_id { Faker::Number.digit }
  end

end
