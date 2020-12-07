require "rails_helper"

RSpec.describe TestimoniesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/testimonies").to route_to("testimonies#index")
    end

    it "routes to #show" do
      expect(get: "/testimonies/1").to route_to("testimonies#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/testimonies").to route_to("testimonies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/testimonies/1").to route_to("testimonies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/testimonies/1").to route_to("testimonies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/testimonies/1").to route_to("testimonies#destroy", id: "1")
    end
  end
end
