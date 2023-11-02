FactoryBot.define do
  factory :user do
    name { 'Name' }
    surname { 'Sutnam' }
    email { 'email@example.com' }
    password { '123456' }

    trait :role_admin do
      role { 'admin' }
    end

    trait :role_user do
      role { 'user' }
    end
  end
end
