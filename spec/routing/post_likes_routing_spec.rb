require "rails_helper"

RSpec.describe PostLikesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/post_likes").to route_to("post_likes#index")
    end

    it "routes to #show" do
      expect(get: "/post_likes/1").to route_to("post_likes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/post_likes").to route_to("post_likes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/post_likes/1").to route_to("post_likes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/post_likes/1").to route_to("post_likes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/post_likes/1").to route_to("post_likes#destroy", id: "1")
    end
  end
end
