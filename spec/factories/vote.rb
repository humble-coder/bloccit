FactoryGirl.define do
  factory :vote do
    user
    post
    value 1

    trait :down_vote do
      value -1
    end
  end
end