FactoryGirl.define do
  factory :post do
    title "One Post"
    body "This is the newest post. It needs 20 char to be saved."
    user
    topic

    factory :post_with_comments do
      ignore do
        comments_count 1
      end

      after(:build) do |post, evaluator|
        build_list(:comment, evaluator.posts_count, post: post)
      end
    end
  end
end