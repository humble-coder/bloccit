require 'spec_helper'

describe UsersController do
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

  describe "GET show" do
    let (:user) { create(:user) }

    it "gets the show page" do
      get :show, id: user.id
      expect(response.status).to eq(200)
    end

    it "renders the show template" do
      get :show, id: user.id
      expect(response).to render_template("show")
    end
  end
end