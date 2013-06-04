require "spec_helper"

describe AdminController do
  describe "routing" do

    it "routes to #index" do
      get("/admin").should route_to("admin#show")
    end

  end
end
