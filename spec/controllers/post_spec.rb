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

# describe Topics::PostsController do

#   describe "Post management" do
#     it "creates a post and redirects to the post's page" do
#       get :new
#       expect(response).to render_template(:new)

#       post "/posts", :post => {:id => "1"}

#       expect(response).to redirect_to(assigns(:post))
#       follow_redirect!

#       expect(response).to render_template(:show)
#       expect(response.body).to include("Post was saved.")
#     end
#   end
# end




# describe Topics::PostsController do
#   render_views

#   describe "GET show" do
#     it "says topic name" do
#       get :show
#       expect(response.body).to include(:topic)
#     end
#   end
# end

