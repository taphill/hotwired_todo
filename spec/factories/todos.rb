FactoryBot.define do
  factory :todo do
    user
    description { Faker::Lorem.sentence(word_count: 4, supplemental: false, random_words_to_add: 4) }
    completed { false }
  end
end
