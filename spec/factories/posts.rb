FactoryBot.define do
  factory :post do
    user
    title { Faker::Books::Dune.title }
    description { Faker::Books::Dune.quote }
    status { "public" }

    trait :draft do
      status { "draft" }
    end
  end
end
