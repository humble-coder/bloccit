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

    factory :user_with_content do
      ignore do
        posts_count 5
        comments_count 5
        votes_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
        create_list(:comment, evaluator.comments_count, user: user)
        create_list(:vote, evaluator.votes_count, user: user)
      end
    end
  end
end