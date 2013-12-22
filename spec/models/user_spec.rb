require 'spec_helper'

describe User do

  describe "#role?" do
    let(:member_user) { create(:user) }
    let(:guest_user) { create(:user) { |user| user.update_attribute(:role, nil) } }

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
  end


  describe "#favorited" do
    let(:post) { create(:post) { |post| post.topic = create(:topic) } }
    let(:user) { create(:user) { |user| user.favorites.create(post: post) } }

    it "should return true because user favorited post" do
      user.favorited(post).should eq(user.favorites.first)
    end
  end


  describe "#voted" do
    let(:post) { create(:post) { |post| post.topic = create(:topic) } }
    let(:user) { create(:user) { |user| user.votes.create(post: post, value: 1) } }

    it "should return true because a user voted on post" do
      user.voted(post).should eq(user.votes.first)
    end
  end



  describe ".top_rated" do
    let!(:u0) { create(:user) do |user| 
        post = user.posts.build(attributes_for(:post))
        post.topic = create(:topic)
        post.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
      end
    }
    
    let!(:u1) { create(:user) do |user| 
        c = user.comments.build(attributes_for(:comment))
        c.post = create(:post)
        c.save
        post = user.posts.build(attributes_for(:post))
        post.topic = create(:topic)
        post.save
        c = user.comments.build(attributes_for(:comment))
        c.post = post
        c.save
      end
    }

    it "should return users based on comments + posts" do
      User.top_rated.should eq([u1, u0])
    end
    it "should have 'posts_count' on user" do
      users = User.top_rated
      users.first.posts_count.should eq(1)
    end
    it "should have user with most total posts and comments in the 0th index of top_rated array" do
      User.top_rated[0].should eq(u1)
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

