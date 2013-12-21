require 'spec_helper'

describe PostsController do
  describe "GET index" do
    it "gets the index page" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end

describe Topics::PostsController do
  render_views

  describe "GET show" do
    it "says topic name" do
      get :show
      expect(response.body).to include(:topic)
    end
  end
end

