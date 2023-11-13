FactoryBot.define do
  factory :feedback do
    user
    title { 'Сообщение обратной связи' }
    message { 'Не получается авторизоваться.' }
  end
end
