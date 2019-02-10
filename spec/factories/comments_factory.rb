FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.paragraph(2, true) }
    denounce { [true, false].sample }

    association :user, factory: :user
    event
  end
end
