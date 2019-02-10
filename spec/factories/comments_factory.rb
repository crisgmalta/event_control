FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.paragraph(2, true)}
  
    #user
    association :user, factory: :user
    event
    
  end
end
