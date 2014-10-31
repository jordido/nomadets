FactoryGirl.define do
  factory :user do
  	name     { Faker::Name.name } # Why using lamdba here?
    email    { Faker::Internet.email }
		last_name { Faker::Name.last_name }
		address { Faker::Address.street_name }
		city { Faker::Address.city }
		state { Faker::Address.state }
		country   {Faker::Address.country }
		description { Faker::Lorem.sentence }
		website_url { Faker::Internet.url }
		password_digest {Faker::Internet.password }
		latitude {Faker::Address.latitude}
		longitude {Faker::Address.longitude}
	end
end
