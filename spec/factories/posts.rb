FactoryBot.define do
  factory :post do
    user
    title { Faker::Books::Dune.title }
    description { Faker::Books::Dune.quote }

    trait :status_public do
      status { 'public' }
    end
  end
end
