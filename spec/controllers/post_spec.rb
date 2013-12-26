require 'spec_helper'

describe PostsController do
  describe "GET index" do
    it "gets the index page" do
      get :index
      expect(response.status).to eq(200)
    end

    # it "retrieves most popular posts" do
    #   get :index
    #   expect(Post).to receive(:where).with("posts.created_at > ?", 7.days.ago)
    # end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
      expect(response.body).to eq ""
    end

    it "renders the posts/index template" do
      get :index
      expect(response).to render_template("posts/index")
      expect(response.body).to eq ""
    end
  end
end
