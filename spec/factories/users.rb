FactoryBot.define do
  factory :user do
    username { Faker::Internet.user_name }
    firstname { Faker::Name.name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end