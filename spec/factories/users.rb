FactoryBot.define do
  factory :user do
    name { "Name" }
    surname { "Surname" }
    email { "email@example.com" }
    password { "123456" }
    role { "user" }

    trait :admin do
      role { "admin" }
    end
  end
end
