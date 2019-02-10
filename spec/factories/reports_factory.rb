FactoryBot.define do
  factory :report do
    association :user, factory: :user
    association :comment, factory: :comment
  end
end
