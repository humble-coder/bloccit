FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email) { |n| "person#{n}@example.com"}
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now


    trait :as_member do
      role "member"
    end

    trait :as_moderator do
      role "moderator"
    end

    trait :as_admin do
      role "admin"
    end
  end
end