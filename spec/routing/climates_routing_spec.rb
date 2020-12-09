require "rails_helper"

RSpec.describe ClimatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/climates").to route_to("climates#index")
    end

    it "routes to #show" do
      expect(get: "/climates/1").to route_to("climates#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/climates").to route_to("climates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/climates/1").to route_to("climates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/climates/1").to route_to("climates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/climates/1").to route_to("climates#destroy", id: "1")
    end
  end
end
