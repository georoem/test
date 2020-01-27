FactoryBot.define do
    factory :album do
        name { Faker::Lorem.word }
        total_tracks { Faker::Number.number(digits:3) }
        spotify_url { Faker::Internet.url }
        spotify_id { Faker::Lorem.word }
    end
end

