FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email) { |n| "person#{n}@example.com"}
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_posts do
      ignore do
        posts_count 1
      end

      after(:build) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
      end
    end

    factory :user_with_comments do
      ignore do
        comments_count 1
      end

      after(:build) do |user, evaluator|
        create_list(:comment, evaluator.comments_count, user: user)
      end
    end

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