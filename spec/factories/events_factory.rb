FactoryBot.define do
  factory :event do
    name {Faker::NatoPhoneticAlphabet.code_word}
    description {Faker::Nation.capital_city}
    lat { Faker::Number.number(8) }
    lng { Faker::Number.number(8) }
    
  end
end
