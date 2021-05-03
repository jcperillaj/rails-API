FactoryBot.define do
  factory :item do
    name { Faker::Movies::StarWars.character }
    todo_id { nil }
  end
end
