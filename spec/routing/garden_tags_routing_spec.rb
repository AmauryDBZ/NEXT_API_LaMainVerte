require "rails_helper"

RSpec.describe GardenTagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/garden_tags").to route_to("garden_tags#index")
    end

    it "routes to #show" do
      expect(get: "/garden_tags/1").to route_to("garden_tags#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/garden_tags").to route_to("garden_tags#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/garden_tags/1").to route_to("garden_tags#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/garden_tags/1").to route_to("garden_tags#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/garden_tags/1").to route_to("garden_tags#destroy", id: "1")
    end
  end
end
