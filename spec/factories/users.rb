FactoryBot.define do
  factory :user do
    name { 'Name' }
    surname { 'Sutnam' }
    email { 'email@example.com' }
    password { '123456' }

    trait :admin do
      role { 'admin' }
    end

    trait :client do
      role { 'client' }
    end
  end
end
