require "rails_helper"

RSpec.describe GardenLikesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/garden_likes").to route_to("garden_likes#index")
    end

    it "routes to #show" do
      expect(get: "/garden_likes/1").to route_to("garden_likes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/garden_likes").to route_to("garden_likes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/garden_likes/1").to route_to("garden_likes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/garden_likes/1").to route_to("garden_likes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/garden_likes/1").to route_to("garden_likes#destroy", id: "1")
    end
  end
end
