# require 'spec_helper'

# describe PostsController do
#   describe "GET index" do
#     it "gets the index page" do
#       get :index
#       expect(response.status).to eq(200)
#     end

#     it "retrieves most popular posts" do
#       expect(Post).to receive(:popular)
#     end

#     it "renders the index template" do
#       get :index
#       expect(response).to render_template("index")
#     end
#   end
# end

# describe Topics::PostsController do

#   describe "GET new"

#   describe "POST create"
#   describe "Post management" do
#     it "creates a post and redirects to the post's page" do
#       get :new
#       expect(response).to render_template(:new)

#       post "/posts", :post => {title => "some post", body => "blah blah blah blah blah blah blah blah blah blah blah blah"}

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

