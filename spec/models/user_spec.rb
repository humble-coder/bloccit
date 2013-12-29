require 'spec_helper'

describe User do

  describe "#role?" do
    let(:guest_user) { build :user }
    let(:member_user) { build :user, :as_member }
    let(:moderator_user) { build :user, :as_moderator }
    let(:admin_user) { build :user, :as_admin }

    it "should return false because member_user is not a moderator" do
      member_user.role?(:moderator).should be_false
    end
    it "should return false because member_user is not an admin" do
      member_user.role?(:admin).should be_false
    end
    it "should return true because member_user is a member" do
      member_user.role?(:member).should be_true
    end
    it "should return false because guest_user is not a member in ROLES" do
      guest_user.role?(:member).should be_false
    end
    it "should return true because moderator_user is a moderator" do
      moderator_user.role?(:moderator).should be_true
    end
    it "should return true because admin_user is an admin" do
      admin_user.role?(:admin).should be_true
    end
  end


  describe "#favorited" do
    let(:post) { build :post }
    let(:user) { create(:user) { |user| user.favorites.create(post: post) } }

    it "should return true because user favorited post" do
      user.favorited(post).should eq(user.favorites.first)
    end
  end


  describe "#voted" do
    let(:post) { build :post }
    let(:user) { create(:user) { |user| user.votes.create(post: post, value: 1) } }

    it "should return true because a user voted on post" do
      user.voted(post).should eq(user.votes.first)
    end
  end



  describe ".top_rated" do
    let!(:passive_user) { create(:user_with_content, posts_count: 1, comments_count: 1) }
    let!(:active_user) { create(:user_with_content, posts_count: 1, comments_count: 2) }

    it "should return users based on comments + posts" do
      User.top_rated.should eq([active_user, passive_user])
    end
    it "should have 'posts_count' on user" do
      users = User.top_rated
      users.first.posts_count.should eq(1)
    end
    it "should have user with most total posts and comments in the 0th index of top_rated array" do
      User.top_rated[0].should eq(active_user)
    end
    it "should have 'comments_count' on user" do
      users = User.top_rated
      users.first.comments_count.should eq(2)
    end
    it "top_user should have more comments and posts than other_user" do
      top_user = User.top_rated.first
      other_user = User.top_rated.last
      (top_user.comments_count + top_user.posts_count).should be > (other_user.posts_count + other_user.comments_count)
    end
  end

end

