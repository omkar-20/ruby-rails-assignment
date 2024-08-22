FactoryBot.define do
  factory :todo, class: Todo do
    title { Faker::Name.name }
    description { 'josh123456' }
  end
end
