FactoryBot.define do
    factory :artist do
        name { Faker::Lorem.word }
        popularity { Faker::Number.number(digits:3) }
        spotify_url { Faker::Internet.url }
        spotify_id { Faker::Internet.url }
    end
end