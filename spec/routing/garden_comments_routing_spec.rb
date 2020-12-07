require "rails_helper"

RSpec.describe GardenCommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/garden_comments").to route_to("garden_comments#index")
    end

    it "routes to #show" do
      expect(get: "/garden_comments/1").to route_to("garden_comments#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/garden_comments").to route_to("garden_comments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/garden_comments/1").to route_to("garden_comments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/garden_comments/1").to route_to("garden_comments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/garden_comments/1").to route_to("garden_comments#destroy", id: "1")
    end
  end
end
