FactoryBot.define do
  factory :feedback do
    user { create(:user) }
    title { 'Сообщение обратной связи' }
    message { 'Не получается авторизоваться.' }
  end
end
